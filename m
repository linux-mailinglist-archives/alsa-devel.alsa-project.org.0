Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E645E83550B
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Jan 2024 10:47:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97740846;
	Sun, 21 Jan 2024 10:47:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97740846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705830461;
	bh=vXMxtbaRXwShp5WwQRmQyAEkRNo7Eo0/Wr29nZuBn8Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q0ANsRjWojrzKlAA9RaprqLm1RsD4gU1J+pAHJ91N2Qed+UaZOdJBC6fLFNa5GUjg
	 u/WvgGHklHEV+mF2UkbafUxI4kAEbEU+dF5+1MBiG5OsXkRENIMO39p/jAWwsh+eXC
	 kdeHi2YxI6YdFZq8CD4ozfMEHvobGq+vcphuaIQg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF567F8025F; Sun, 21 Jan 2024 10:47:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A140FF8057B;
	Sun, 21 Jan 2024 10:47:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 649B6F8025F; Sun, 21 Jan 2024 10:42:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 980FFF800C1
	for <alsa-devel@alsa-project.org>; Sun, 21 Jan 2024 10:42:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 980FFF800C1
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rRULZ-00050W-CV; Sun, 21 Jan 2024 10:42:33 +0100
Message-ID: <4c69cb61-1a43-4bfe-b01a-8118967ddbaf@leemhuis.info>
Date: Sun, 21 Jan 2024 10:42:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/10] spi: Add multi-cs memories support in SPI core
Content-Language: en-US, de-DE
To: Guenter Roeck <linux@roeck-us.net>,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, git@amd.com,
 sbinding@opensource.cirrus.com, richard@nod.at, lee@kernel.org,
 tudor.ambarus@linaro.org, amitrkcian2002@gmail.com,
 linux-sound@vger.kernel.org, james.schulman@cirrus.com,
 rf@opensource.cirrus.com, broonie@kernel.org, tiwai@suse.com,
 perex@perex.cz, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, claudiu.beznea@tuxon.dev,
 linux-spi@vger.kernel.org, michael@walle.cc, david.rhodes@cirrus.com,
 pratyush@kernel.org
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-4-amit.kumar-mahapatra@amd.com>
 <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1705830163;b4223a5c;
X-HE-SMSGID: 1rRULZ-00050W-CV
Message-ID-Hash: SLKY4AFNSHDTXL24VO7IFO7LBMH5B4N6
X-Message-ID-Hash: SLKY4AFNSHDTXL24VO7IFO7LBMH5B4N6
X-MailFrom: regressions@leemhuis.info
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SLKY4AFNSHDTXL24VO7IFO7LBMH5B4N6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12.01.24 20:11, Guenter Roeck wrote:
> 
> On Sat, Nov 25, 2023 at 02:51:30PM +0530, Amit Kumar Mahapatra wrote:
>> AMD-Xilinx GQSPI controller has two advanced mode that allows the
>> controller to consider two flashes as one single device.
>>
>> One of these two mode is the parallel mode in which each byte of data is
>> stored in both devices, the even bits in the lower flash & the odd bits in
>> the upper flash. The byte split is automatically handled by the QSPI
>> controller.
> [...]
> With this patch in the mainline kernel, two of my qemu emulations
> (quanta-q71l-bmc and almetto-bmc) fail to instantiate the first SPI
> controller and thus fail to boot from SPI. The error message is
> 
> [    3.006458] spi_master spi0: No. of CS is more than max. no. of supported CS
> [    3.006775] spi_master spi0: Failed to create SPI device for /ahb/spi@1e620000/flash@0
> 
> The problem is no longer seen after reverting this patch.
> [...]
> # first bad commit: [4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b] spi: Add multi-cs memories support in SPI core

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 4d8ff6b0991d5e86b17b235fc46ec62e9195cb9
#regzbot title spi: qemu emulations quanta-q71l-bmc and almetto-bmc fail
to boot
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
