Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EFA7B3F13
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:13:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B482FCB;
	Sat, 30 Sep 2023 10:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B482FCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061608;
	bh=dkq2hRA6tEJuaVfLvLXmXs5mhMTyYd6wkE4/+O17Q+o=;
	h=Date:Subject:To:Cc:References:From:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NL9kfzB3WJfN8Vge5CNtTzpBcbj2He1rVLeVkspIvf0pLZRCMWpsqFKiAw37f/V3S
	 BnqXkQS54lQBi/dS9xe/byXvRFcSRqvPCLArGkQh/nCscygNrjmv0r+gdzIYqXzKgN
	 N1VJ/C4U0+iSGBtzYPk4Odb0dkHNQm/ck3AJNO2E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9BF5F805E7; Sat, 30 Sep 2023 10:09:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BAFAF805DA;
	Sat, 30 Sep 2023 10:09:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A47DF8016A; Wed, 27 Sep 2023 22:19:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from abi149hd127.arn1.oracleemaildelivery.com
 (abi149hd127.arn1.oracleemaildelivery.com [129.149.84.127])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31D79F80130
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 22:19:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31D79F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=augustwikerfors.se header.i=@augustwikerfors.se
 header.a=rsa-sha256 header.s=oci-arn1-20220924 header.b=RhXS84vf;
	dkim=pass (2048-bit key,
 unprotected) header.d=arn1.rp.oracleemaildelivery.com
 header.i=@arn1.rp.oracleemaildelivery.com header.a=rsa-sha256
 header.s=prod-arn-20211201 header.b=QDFPYcwG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-arn1-20220924;
 d=augustwikerfors.se;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=kWHEaE4TCj1UBa4oGH5EPwk2RSc/PwXJfUkNV04nu6I=;
 b=RhXS84vf0w7Pw69zK6/BkeWyxdOFSCQSUp5nXqJJrt2F/hejIDw3ZNHFevrGwjN/2JTHiff7Thdy
   BWVoriuzf4eqc+CYv1Gk6nq8Yo82nIiJO9n+sJEv5AF0hwAHwiENrKiEzHeU0Z6JSaI9OWQWbGXe
   NcZ6Ez9SPlWUmpjEPutR7QTG/4v8bZXIG364vtOu2QXR/p/Lb1tGvNGvX/Wa0m7vbd1kDMDPhlwX
   tVUQH2rOiRjIdX3peo6jWJVMl9D4XO1ghescauMUkN+W2TNmdsnITzErbthlZx6TjR6ZaQzAQMnn
   SrGYy1mxxUo3try63WvI012JbGfCpJN+2EO5Vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-arn-20211201;
 d=arn1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=kWHEaE4TCj1UBa4oGH5EPwk2RSc/PwXJfUkNV04nu6I=;
 b=QDFPYcwGB+JfAxg30wPhmGfYIBQB3XpFT4dnRJgIFNIWEwAnlw4xgEORL4qaebBgruJQvXGv0dvz
   1XEzm5BytHAMHaBHMx7CQrxccZKJfWIoDTd/Ds9xUJDZSKwCJQIXr5qIO1zMUMY3DLG70Zojy9kX
   2DY/cYRVakfccJopC88oQ0Ybux3phjnI8EWdB+16gjyg9Dm4QWw0wKGsTgkVNbLD/MnfaCocwft0
   qVLTgj1kIBVnA1qTPjJHzhG7Y58jI+fCDVr+4T7CC9RSJX/DIuYWX4FKw9pN0RdN4TTnE2wbby0u
   zmwAxJLWsjXsWgZ8uw4wZLHNDqiW2/0CSpupBw==
Received: by omta-ad1-fd2-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20230808 64bit (built Aug  8
 2023))
 with ESMTPS id
 <0S1N00N4BV448JA0@omta-ad1-fd2-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com>
 for alsa-devel@alsa-project.org; Wed, 27 Sep 2023 20:19:16 +0000 (GMT)
Message-id: <e67aec21-eb9b-4133-b879-7b2b6d03f50e@augustwikerfors.se>
Date: Wed, 27 Sep 2023 22:19:12 +0200
MIME-version: 1.0
Subject: Re: [PATCH v2] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
Content-language: en-US
To: Sven Frotscher <sven.frotscher@gmail.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
 regressions@lists.linux.dev
References: <O2TN1S.57QJOL6TXOBC1@gmail.com>
From: August Wikerfors <git@augustwikerfors.se>
In-reply-to: <O2TN1S.57QJOL6TXOBC1@gmail.com>
Content-type: text/plain; charset=UTF-8; format=flowed
Content-transfer-encoding: 8bit
Reporting-Meta: 
 AAEINYZ3dhLONaY9tyI3lZesZ89O1+5jgsVyp4dMSkyYuppG/dP70jN8lViyntJq
 I5DRJNIssIA14bGdujZvfmSb5GPSDteTcc1H+i1+8eiOCvrzErUlRPrwGbWhDzzs
 L1EeEPCXgnEH0csmPMzSARgIE/zlpG+9xIL6Z3gdijyff1QcJIEvM96roZwfsUFV
 8cz6vUC4M4CzrdXotXFTM2/qgPxS6euvHWIPA5RS5cR8pqdb7hRaaE7WKEpznDAi
 Fl9bI8fC9tSy99309HjUp+97rhVIThdOWdRTlVnyg5sGKoE5GoGKVopXXFZqp2He
 wnyFC/Hcu3v6RK7/O518GlTSYxTJ6Ir3uetyDj2iDxN8V6+69Kyz8RroZf57pEjZ
 QvqsEsMKPK47nGfYWhkIUKgevUt47L3is13vy2n16ZaKaWNdBs3MPRDKWBrevfIY LEcr73k=
X-MailFrom: 
 bounces+alsa-devel=alsa-project.org@arn1.rp.oracleemaildelivery.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 46H6C7V5JWB3E2BEZ4HEATS75NIVRWCN
X-Message-ID-Hash: 46H6C7V5JWB3E2BEZ4HEATS75NIVRWCN
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:09:28 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/46H6C7V5JWB3E2BEZ4HEATS75NIVRWCN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Sven,

On 2023-09-27 21:35, Sven Frotscher wrote:
> 
> Like the Lenovo 82TL, 82V2, 82QF and 82UG, the 82YM (Yoga 7 14ARP8)
> requires an entry in the quirk list to enable the internal microphone.
> The latter two received similar fixes in commit 1263cc0f414d.
> 
> Fixes: c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on Lenovo 
> 82SJ")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sven Frotscher <sven.frotscher@gmail.com>
> ---
> v1->v2 changes:
> * add Fixes and Cc tags to commit message
> * remove redundant LKML link from commit message
> * fix mangled diff
> 
> sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
> 1 file changed, 7 insertions(+)
> 
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index 3d8a51351e29..e3d2b9d01552 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -241,6 +241,13 @@ static const struct dmi_system_id 
> yc_acp_quirk_table[] = {
>          DMI_MATCH(DMI_PRODUCT_NAME, "82V2"),
>      }
>      },
> +    {
> +    .driver_data = &acp6x_card,
> +    .matches = {
> +        DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +        DMI_MATCH(DMI_PRODUCT_NAME, "82YM"),
> +    }
> +    },
>      {
>      .driver_data = &acp6x_card,
>      .matches = {
This diff still doesn't look right, some of the lines are indented by 
one tab too little compared to the original code. Also, the e-mail is 
sent with format=flowed which git am complains about:

> warning: Patch sent with format=flowed; space at the end of lines might be lost.
> Applying: ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
> error: corrupt patch at line 15

It's better to send patches with git send-email to avoid these problems.

Regards,
August Wikerfors
