Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 990D01092F8
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2019 18:40:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2690D178C;
	Mon, 25 Nov 2019 18:40:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2690D178C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574703655;
	bh=xNpofTWw3gc03ba6xoc9SVoWEX1PGDYdwduC5Y9l2Nk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B6t32EoGeAXqbyC1jsFKXFdho0H5+MZmrZmwgu6x1gmUmbW85wd0bdnD7yUrCf+UR
	 ibCUFFsJ0jkBx1/ctV4/nO/jeXunvXiSrU3ARMQIToqXQr+YJuqmPrZR2/5jdNoLSD
	 R8kCcQWz9XBncGzIe6kQUl3fsqDh5VYbpUPzivkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9317CF80171;
	Mon, 25 Nov 2019 18:39:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60B18F8016F; Mon, 25 Nov 2019 18:39:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.xn--80adja5bqm.su (xn--80adja5bqm.su [45.62.210.217])
 by alsa1.perex.cz (Postfix) with ESMTP id 5B588F800AB
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 18:39:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B588F800AB
Received: by mail1.xn--80adja5bqm.su (Postfix, from userid 1000)
 id EA39820C5462; Mon, 25 Nov 2019 18:39:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail1.xn--80adja5bqm.su EA39820C5462
Date: Mon, 25 Nov 2019 18:39:02 +0100
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: Takashi Iwai <tiwai@suse.de>
Message-Id: <20191125173902.GA27981@xn--80adja5bqm.su>
References: <20190719111231.GA26592@xn--80adja5bqm.su>
 <s5hzhla9j8b.wl-tiwai@suse.de>
 <20190720165435.GA5855@xn--80adja5bqm.su>
 <20190819195714.GA2737@xn--80adja5bqm.su>
 <s5hef1dthbk.wl-tiwai@suse.de>
 <20190822203031.GA22363@xn--80adja5bqm.su>
 <s5h5zmg48u2.wl-tiwai@suse.de>
 <20190829103805.GA1525@xn--80adja5bqm.su>
 <s5hsgpk2os6.wl-tiwai@suse.de>
 <20190830114510.GA10027@xn--80adja5bqm.su>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190830114510.GA10027@xn--80adja5bqm.su>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Surround speaker connection on Acer 8951G
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Takashi,

sorry - it's me again about the Acer 8951G LFE speaker.

On Fri, Aug 30, 2019 at 01:45:10PM +0200, Sergey 'Jin' Bostandzhyan wrote:
> > > The below HDA_FIXUP_VERBS does the trick, so I do have all 6 speakers working, 
> > > finally!
> > > 
> > > {0x01, AC_VERB_SET_GPIO_DIRECTION, 0x02}
> > 
> > Actually this must be paired with the corresponding bit of GPIO_DATA,
> > too.  Is the bit 0x02 of GPIO_DATA set or cleared?  Usually setting it
> > turns on the amp, but sometimes inverted.
> 
> If I understood everything correctly, then the bit is set, meaning that the
> GPIO signal is configured as output. I'll be honest, I exported the
> hda-analyzer setting as a python script (nice feature btw) and deducted the
> fixup verb setting from there (relevant part of the hda-analyzer export below):
> 
> def set(nid, verb, param):
>   verb = (nid << 24) | (verb << 8) | param
>   res = ioctl(FD, IOCTL_VERB_WRITE, struct.pack('II', verb, 0))  
> 
> set(0x01, 0x717,   0x02) # 0x01071702 (SET_GPIO_DIRECTION)

it seems I indeed missed something here regarding GPIO_DATA, I really am
not sure what the influence is, but after updating to Fedora 31 my LFE
stopped working, even with the self compiled 5.4-rc8 kernel which I am running
now (all the time before I was on Fedora 29 and I just backported my patch to 
5.2.x and compiled the modules outside the tree after being done with the 
patch submission).

So ultimately, it seems I now need to do the following in my fixup
(original commit was 00066e9733f629e536f6b7957de2ce11a85fe15a):

--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8875,7 +8875,7 @@ static const struct hda_fixup alc662_fixups[] = {
                .v.verbs = (const struct hda_verb[]) {
                        {0x01, AC_VERB_SET_GPIO_MASK, 0x02},
                        {0x01, AC_VERB_SET_GPIO_DIRECTION, 0x02},
-                       {0x01, AC_VERB_SET_GPIO_DATA, 0x00},
+                       {0x01, AC_VERB_SET_GPIO_DATA, 0x02},
                        { }
                },
                .chained = true,

My question is: could something on the outside have influence on that? I am
really very, very sure that I have tested LFE on kernel 5.4-rc before 
submitting the original patch and it has been working as submitted.
Why did the behavior change now? What else could I have missed?

I guess I have to submit the above change again, but I would like to make
sure that I am not missing something else somewhere, something that could cause
a change of behavior yet again after some future update.

Kind regards,
Jin




_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
