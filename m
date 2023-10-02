Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0467B5343
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 14:30:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46702E0D;
	Mon,  2 Oct 2023 14:29:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46702E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696249802;
	bh=aMGP7cOquD65ZoB1BHMnImU3Yf5PWZleINA2pr++r1Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vrwY5Z7ZkoaNLUepRmFwCP9K/qdoiXOwweHQki/yyZ2mnDwtaIpGnKBIv6bbTS3I4
	 YVUmIsa/nJFU17zz0zahNO4j4m8XTXQKkVnTJWgxB22K5EW1yg08dOUI1CqBN6brjl
	 gWd3/8cLKVu4nzkT4Ea293OwlZgP3ZmQK7eLyEWA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 965CDF80310; Mon,  2 Oct 2023 14:29:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E23ACF802E8;
	Mon,  2 Oct 2023 14:29:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA415F80310; Mon,  2 Oct 2023 14:29:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2C62F800C1
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 14:28:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2C62F800C1
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qnI2a-0001s7-7U; Mon, 02 Oct 2023 14:28:48 +0200
Message-ID: <541ac45b-8de7-4fa2-85ee-456d34e60aa9@leemhuis.info>
Date: Mon, 2 Oct 2023 14:28:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
Content-Language: en-US, de-DE
To: Mark Brown <broonie@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Sven Frotscher <sven.frotscher@gmail.com>, mario.limonciello@amd.com,
 git@augustwikerfors.se, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
References: <20230927223758.18870-1-sven.frotscher@gmail.com>
 <46560887-0b6e-42ac-96c3-b4dbc1d7cb61@leemhuis.info>
 <4fa7d39d-dc34-4550-97fa-2b089f364cca@sirena.org.uk>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <4fa7d39d-dc34-4550-97fa-2b089f364cca@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1696249734;9683c95d;
X-HE-SMSGID: 1qnI2a-0001s7-7U
Message-ID-Hash: WW45J73YYT77KVLFTAO4IHEI52DLL5R3
X-Message-ID-Hash: WW45J73YYT77KVLFTAO4IHEI52DLL5R3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WW45J73YYT77KVLFTAO4IHEI52DLL5R3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 02.10.23 13:52, Mark Brown wrote:
> On Mon, Oct 02, 2023 at 11:32:48AM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> 
>> Makes me wonder: How many more such quirk entries will be needed? Will
>> we have all machines listed soon, or do we expect that future Lenovo
>> hardware will need entries as well? If it's the latter: are quirks
>> really the right solution here, or do they just hide some bug or then
>> need for code that automatically handles things?
> 
> x86 firmware descriptions are terrible, it's just an endless procession
> of quirks.  The model for ACPI is not to describe key information in the
> kernel and instead on Windows load device specific information from
> separately supplied tables.  On Linux that translates into these endless
> quirks, on Windows it's platform specific drivers for otherwise generic
> audio hardware.

I know all of that, but from the many recent regression reports and
patches it seems quirks were not needed for a bunch of Lenovo machines
before c008323fe361bd ("ASoC: amd: yc: Fix a non-functional mic on
Lenovo 82SJ") [v6.5]. That made me wonder if that commit really did the
right thing or if there is a underlying bug somewhere that the newly
added quirks hide, as I had a few such situations during the past few
months. If you or others the experts in this area say that this is not
the case here then I'm totally fine with that, it was just a question.

Ciao, Thorsten
