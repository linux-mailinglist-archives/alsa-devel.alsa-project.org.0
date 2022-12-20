Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A95EF651FF3
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 12:54:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 445821906;
	Tue, 20 Dec 2022 12:53:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 445821906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671537282;
	bh=U3pb1+rVWHGesSXL3C56Ot2ILDaqbrmcZ+s6yqDcFDA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UcH5Crg68tTAC9lqcx7nE4Hy5UrptBGWMZVUXIoA0Rtm13LZhwphbrJy1xhv/nl4j
	 KN1Ip+eoAU1VL4/xeAeg5EhShwM37woC/yF6ObhxHVQb198ZpRDlEEZJz2zJx3qFQt
	 jkAG1RZlBAWq5R9iOQq30BbYdxsopjlxMHSpwyQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4065F8026D;
	Tue, 20 Dec 2022 12:53:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99189F8045D; Tue, 20 Dec 2022 12:53:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C31C7F8026D
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 12:53:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C31C7F8026D
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1p7bBg-0005om-AI; Tue, 20 Dec 2022 12:53:36 +0100
Message-ID: <7043e971-c320-b1aa-8e7c-35df0eceb16c@leemhuis.info>
Date: Tue, 20 Dec 2022 12:53:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/2] ASoC: SOF: remove unregister calls from shutdown
Content-Language: en-US, de-DE
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20221209114529.3909192-1-kai.vehmanen@linux.intel.com>
 <167102472177.27755.10161077455234852195.b4-ty@kernel.org>
 <e23ec080-9fe4-ee28-1d4c-879127803660@leemhuis.info>
 <Y6BhTWGUp2D5hhbE@sirena.org.uk>
 <alpine.DEB.2.22.394.2212201334340.3532114@eliteleevi.tm.intel.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <alpine.DEB.2.22.394.2212201334340.3532114@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1671537221;
 60e24252; 
X-HE-SMSGID: 1p7bBg-0005om-AI
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Alsa-devel <alsa-devel@alsa-project.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Takashi Iwai <tiwai@suse.de>, yung-chuan.liao@linux.intel.com,
 Oliver Neukum <oneukum@suse.com>, peter.ujfalusi@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 Zhen Ni <nizhen@uniontech.com>, ranjani.sridharan@linux.intel.com,
 Ricardo Ribalda <ribalda@chromium.org>,
 Archana Patni <archana.patni@intel.com>, daniel.baluta@nxp.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 20.12.22 12:41, Kai Vehmanen wrote:
> 
> On Mon, 19 Dec 2022, Mark Brown wrote:
> 
>> On Mon, Dec 19, 2022 at 10:41:41AM +0100, Thorsten Leemhuis wrote:
>>
>>> * there are no "CC: <stable..." tags in these patches. Is the plan to
>>> manually ask for a backport? Or how can we get the regression fixed in
>>> older releases?
>>
>> Speak to the stable maintainers I guess, or hope their bot picks the
>> commits up.
> 
> thanks Thorsten for the notice. These patches do lack the "Fixes:" tag, so 
> it's possible the bots will not pick these up. I can follow up and send 
> these to stable if this does not happen.

Thanks, that would be great, I try to stay out of that business, as
actual developers of the code in question are in the best position to
judge and handle things like this.

Ciao, Thorsten
