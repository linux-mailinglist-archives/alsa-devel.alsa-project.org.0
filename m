Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AEC7B4F18
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 11:33:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21E5ADF0;
	Mon,  2 Oct 2023 11:33:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21E5ADF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696239238;
	bh=tnPTHOI7XytPLfHuIGFQp6gW7Bk4STYo7KC6dL2AgOY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eyrw3PV8oUrJjRHvvZzi6+bWQ6nVVsy4f1YkWcowtFYCbLpi/q5hpGvWFEEG2qdQW
	 tN+ym+Pq/GdGXHe3BggOetFxZvScAyhx94Vit+AymeCg1H+7fBPD7yDG3JnrJG7rgk
	 Qx/ot7qVNMnODQSH8zvc1r/5BiqkPQwo0lJoa8uE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84CA6F80552; Mon,  2 Oct 2023 11:33:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 293D4F802E8;
	Mon,  2 Oct 2023 11:33:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6501F80310; Mon,  2 Oct 2023 11:33:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41C12F80166
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 11:32:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41C12F80166
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qnFIJ-0007Xi-6c; Mon, 02 Oct 2023 11:32:51 +0200
Message-ID: <46560887-0b6e-42ac-96c3-b4dbc1d7cb61@leemhuis.info>
Date: Mon, 2 Oct 2023 11:32:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
Content-Language: en-US, de-DE
To: Sven Frotscher <sven.frotscher@gmail.com>, broonie@kernel.org,
 mario.limonciello@amd.com
Cc: git@augustwikerfors.se, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
References: <20230927223758.18870-1-sven.frotscher@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <20230927223758.18870-1-sven.frotscher@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1696239175;6b305401;
X-HE-SMSGID: 1qnFIJ-0007Xi-6c
Message-ID-Hash: ZLHAZ6JFKA2EVQNYNBQBMR76FDQ4WCM6
X-Message-ID-Hash: ZLHAZ6JFKA2EVQNYNBQBMR76FDQ4WCM6
X-MailFrom: regressions@leemhuis.info
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZLHAZ6JFKA2EVQNYNBQBMR76FDQ4WCM6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

[adding Takashi to this, in case he wants to chime in]

Sven, first off, thx for taking care of this.

On 28.09.23 00:36, Sven Frotscher wrote:
> Like the Lenovo 82TL, 82V2, 82QF and 82UG, the 82YM (Yoga 7 14ARP8)
> requires an entry in the quirk list to enable the internal microphone.
>
> The latter two received similar fixes in commit 1263cc0f414d
> ("ASoC: amd: yc: Fix non-functional mic on Lenovo 82QF and 82UG").
>> Fixes: c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on
Lenovo 82SJ")

FWIW, apparently the Leonovo Yoga Slim 7 Pro 82UU needs an quirk entry
as well: https://bugzilla.kernel.org/show_bug.cgi?id=217063#c23

Makes me wonder: How many more such quirk entries will be needed? Will
we have all machines listed soon, or do we expect that future Lenovo
hardware will need entries as well? If it's the latter: are quirks
really the right solution here, or do they just hide some bug or then
need for code that automatically handles things?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.


> Cc: stable@vger.kernel.org
> Signed-off-by: Sven Frotscher <sven.frotscher@gmail.com>
>
> [...]
>
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index 94e9eb8e73f2..15a864dcd7bd 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -241,6 +241,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "82V2"),
>  		}
>  	},
> +	{
> +		.driver_data = &acp6x_card,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "82YM"),
> +		}
> +	},
>  	{
>  		.driver_data = &acp6x_card,
>  		.matches = {
