Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E71847B3F0A
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:11:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B9B7EC6;
	Sat, 30 Sep 2023 10:10:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B9B7EC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061490;
	bh=sQuUQbG0PBQ334ZvXSaWByq89UXDki4JqHCtU5iUUK4=;
	h=Date:From:Subject:To:Cc:References:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MV95dMpqPh/wNPOiQGeooBrTwENcj2MsPwY8mk300eA0FB37Odvr27HwhE6qMsvYY
	 jJvtd8u02n/9NBP5TUTVlE+AigpMyVvZf/hUoajCFhXnEn7ueZEGM7skrasxAp2+J8
	 wj2XqRzgHNjU9wAhk+p49m6URjInRkmSNMA5BlbM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E1DEF806AB; Sat, 30 Sep 2023 10:07:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFD2CF806AB;
	Sat, 30 Sep 2023 10:07:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DA8EF8016A; Wed, 27 Sep 2023 19:42:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from abi149hd126.arn1.oracleemaildelivery.com
 (abi149hd126.arn1.oracleemaildelivery.com [129.149.84.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 637D7F8007C
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 19:41:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 637D7F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=augustwikerfors.se header.i=@augustwikerfors.se
 header.a=rsa-sha256 header.s=oci-arn1-20220924 header.b=BZ6DMylt;
	dkim=pass (2048-bit key,
 unprotected) header.d=arn1.rp.oracleemaildelivery.com
 header.i=@arn1.rp.oracleemaildelivery.com header.a=rsa-sha256
 header.s=prod-arn-20211201 header.b=BH10ErWP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-arn1-20220924;
 d=augustwikerfors.se;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=2/l64ESvX3L+vIHRLzcU/B0t8GMPI3Lpqyo4lNmvNeU=;
 b=BZ6DMyltQg9yBoL1mS43hzA2MCs+q9DFw81K7XlQHjU49XM4rEDqk0nyfs7843qfR1mbCF4+MOvw
   bhuhd1j8NaUi0IShlAjYSLHJMW4Kc5yIgaxU60a0WFxsw32rNZN24rBw0cyV4zbmM2rv74gWKXV3
   psg9Dz8KM/nRvTI013x3wrCKuSw+OpWzxeMJoE5bodFpyodDIsJZ5+6sLkUh06F4EcwpUdhM38/C
   Dl+tDTnbRuKYuquaOK+03d9WIII54ouMkspeo7ifm4Zy0D0jeSF0n3vD0buj2/AXNfl5l5Qwv2IX
   mSh5yGGfjDmBAL+t/jouxvHBUpW0/P88xWspmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-arn-20211201;
 d=arn1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=2/l64ESvX3L+vIHRLzcU/B0t8GMPI3Lpqyo4lNmvNeU=;
 b=BH10ErWPgQ3N4JyLJnenvlfMwWtjlPJFY8F0LeqXHJvyzOTV4PKksa1LDctAPM2gwFIUAy/pbZzg
   U/EFADGUh22sF88aUDsdSPk6J07eMfQcokVGd4KllumpIm6BGmkHloGommo11csFtKvxCp3AQ3Li
   iK1nJNbdHRTuRse8Sef7c+wUGH04rYzoq7vW2FSySMRmTSupCW857Rq2xq4uAeeUiOkTEKEh3V+i
   9WvpIkD/fMWwE1mM/xPVUlB33qw2rcx8kc4swJZwKtexaoNV2X/qMdHJz8ruTDkVSZf3bDeyU43D
   0rZlczrel4JeQmy33pTqa/GJS251mqHkz7fXHA==
Received: by omta-ad1-fd3-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20230808 64bit (built Aug  8
 2023))
 with ESMTPS id
 <0S1N0049TNTNQ700@omta-ad1-fd3-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com>
 for alsa-devel@alsa-project.org; Wed, 27 Sep 2023 17:41:47 +0000 (GMT)
Message-id: <e8479eff-a5cb-41b0-8bf6-bcc20ccbecfb@augustwikerfors.se>
Date: Wed, 27 Sep 2023 19:41:43 +0200
MIME-version: 1.0
From: August Wikerfors <git@augustwikerfors.se>
Subject: Re: [PATCH] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
To: Sven Frotscher <sven.frotscher@gmail.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
 regressions@lists.linux.dev
References: <R5KN1S.18M6QDS4T9PY1@gmail.com>
Content-language: en-US
In-reply-to: <R5KN1S.18M6QDS4T9PY1@gmail.com>
Content-type: text/plain; charset=UTF-8; format=flowed
Content-transfer-encoding: 7bit
Reporting-Meta: 
 AAEINYZ3dhLONaY9tyI3lZesZ89O1+5jgsVyp4dMSkyYuppG/dP70jN8lViyntJq
 I5DRJNIssIA14bGdujauc2Sb5GPSDteTcc2ej6KPI0QA8XftcxM/z5SADAlnB7on
 GNW6XUpIcWJK9wdwGqOMpR9mwolJRH3Qe9FX9lvcHJNLaBxNheyXAUd/i7FgyKoJ
 OJWb5XV9SxJEfjn4UITFq+ph9G3pxGrESIaqUMmklaT8zdMn8bZecMQHWkzVGima
 oljN5mKETDiQVZ+ek9hsk73GN0lWxHn3vx179oF5zO4IaOsT5cHwtJIhWwf9xbmf
 b2JzNLm2HwBNP3oupBnlq8AAoJ5upZZq8VqHmzBPQiLko+uRB4Qm/EYuteGH9kH5
 8l+bZ1Y/8wEn2/BdUXa9OHFOv3IiQj0VKCejcPN5URD0l9X88a6YAiJ1D6YLD9JN GaX7/w==
X-MailFrom: 
 bounces+alsa-devel=alsa-project.org@arn1.rp.oracleemaildelivery.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6YOIHGPCZNBBL4Y5JQFYDRDPPWGRDZXJ
X-Message-ID-Hash: 6YOIHGPCZNBBL4Y5JQFYDRDPPWGRDZXJ
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:07:27 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6YOIHGPCZNBBL4Y5JQFYDRDPPWGRDZXJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 2023-09-27 18:22, Sven Frotscher wrote:
> 
> Like the Lenovo 82TL, 82V2, 82QF and 82UG, the 82YM (Yoga 7 14ARP8)
> requires an entry in the quirk list to enable the internal microphone.
> The latter two received similar fixes in commit 1263cc0f, see
> https://lore.kernel.org/r/20230911213409.6106-1-git@augustwikerfors.se.
> 
> Signed-off-by: Sven Frotscher <sven.frotscher@gmail.com>
Since this fixes a regression caused by commit c008323fe361 which has
been backported to stable, please add "Fixes:" and "Cc:" tags above the
"Signed-off-by:" tag to ensure the fix also gets backported in a timely
manner [1]:

Fixes: c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on Lenovo 82SJ")
Cc: stable@vger.kernel.org

> ---
> sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
> 1 file changed, 7 insertions(+)
> 
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index 3d8a51351e29..e3d2b9d01552 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -241,6 +241,13 @@ static const struct dmi_system_id 
> yc_acp_quirk_table[] = {
>  >..>...>...DMI_MATCH(DMI_PRODUCT_NAME, "82V2"),
>  >..>...}
>  >..},
> +>..{
> +>..>....driver_data = &acp6x_card,
> +>..>....matches = {
> +>..>...>...DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +>..>...>...DMI_MATCH(DMI_PRODUCT_NAME, "82YM"),
> +>..>...}
> +>..},
>  >..{
>  >..>....driver_data = &acp6x_card,
>  >..>....matches = {
Your e-mail client seems to have mangled the leading whitespace here,
which will prevent the patch from applying cleanly. It is strongly
recommended [2] to use git send-email for sending patches, see [3] for a
tutorial on how to set up and use it. For other e-mail clients, see [4].

[1] https://www.kernel.org/doc/html/latest/process/handling-regressions.html#what-s-important-when-fixing-regressions
[2] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text
[3] https://git-send-email.io/
[4] https://www.kernel.org/doc/html/latest/process/email-clients.html

Regards,
August Wikerfors
