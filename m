Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D3F94EB5
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2019 22:08:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E07C91678;
	Mon, 19 Aug 2019 22:07:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E07C91678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566245293;
	bh=hJF5YF826XiTk4+hPsvuL7Szx58tvSIUVt4G8x0MUPs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=POUVnh4oePIv9lHth2yq4k8i8bxnVhmem/+tN5SP0At6P0iFAsh7xQtHju7yuVL+l
	 AsBj3+m9ioe94TMPy6qiPQrrUQzMEabXBgr5QAmwDhAIKTItDQYN5Wi6hEuFGpi9f3
	 uP/DINvRbmE1kS4oWUJLT2LYPLkAAhw2ZsL2WnHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BFF8F80306;
	Mon, 19 Aug 2019 22:07:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98683F802BE; Mon, 19 Aug 2019 22:07:18 +0200 (CEST)
Received: from mail1.xn--80adja5bqm.su (xn--80adja5bqm.su [45.62.210.217])
 by alsa1.perex.cz (Postfix) with ESMTP id 5B038F802FB
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 21:57:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B038F802FB
Received: by mail1.xn--80adja5bqm.su (Postfix, from userid 1000)
 id BFA7A200A34C; Mon, 19 Aug 2019 21:57:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail1.xn--80adja5bqm.su BFA7A200A34C
Date: Mon, 19 Aug 2019 21:57:14 +0200
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: Takashi Iwai <tiwai@suse.de>
Message-Id: <20190819195714.GA2737@xn--80adja5bqm.su>
References: <20190404192430.GA24729@xn--80adja5bqm.su>
 <20190719111231.GA26592@xn--80adja5bqm.su>
 <s5hzhla9j8b.wl-tiwai@suse.de>
 <20190720165435.GA5855@xn--80adja5bqm.su>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190720165435.GA5855@xn--80adja5bqm.su>
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

On Sat, Jul 20, 2019 at 06:54:35PM +0200, Sergey 'Jin' Bostandzhyan wrote:
> On Fri, Jul 19, 2019 at 04:44:52PM +0200, Takashi Iwai wrote:
> > It might be some other external stuff like an external amp that is
> > missing.  Often it's managed via GPIO or EAPD (that is controlled by
> > HD-audio itself), but sometimes via a vendor-specific verb, or even
> > over a completely different i2c...
> > 
> > In the case of vendor verbs, you can take a look at other quirks for
> > similar models that touches lots of COEF stuff.
> 
> thanks for the pointers, does not sound simple, let's see if I get anywhere,
> I will for sure try.

I am going at a slow pace, but I did not give up and I'd be happy if you or
anyone else from the list would find the time to answer some questions from 
time to time.

Right now I am mostly studying patch_realtek.c, as a first step I want to
make sure that at least my known pins get set up by the driver without
having to go via hdajackretask.

I got my build set up, I also dug up hda-decode-pincfg from the hda-emu
sources and made it compile (very useful if one wants to understand and
compare the pin configurations in patch_realtek.c), so now I am trying
things out every other evening.

One part that is not quite clear to me: what the heck is ALC669X?

Could someone please explain the meaning of alc_codec_rename_pci_table ?

Entry for my vendor id looks like this:
    { 0x10ec0670, 0x1025, 0, "ALC669X" },

If I search for that vendor id further in the code, I see that it gets
patched as ALC662?

    HDA_CODEC_ENTRY(0x10ec0670, "ALC670", patch_alc662),

At the same time the documentation in models.rst lists those numbers
together:

ALC66x/67x/892

I already looked at the hda-audio specification from Intel to get a general
understanding, but I was also pulling some Realtek specs which do describe
implemented verbs and things like that (my hope was to see something
vendor related which could hint me how to enable the subwoofer).

I was not able to find any 669 Realtek datasheets, I did however find
the ones for ALC665 and ALC892. How specific is all of this, i.e. should I
keep looking for the exact one or am I on the wrong path here?

Kind regards,
Jin
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
