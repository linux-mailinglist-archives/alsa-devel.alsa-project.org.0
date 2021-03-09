Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7FB331BCA
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 01:39:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B36918AA;
	Tue,  9 Mar 2021 01:39:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B36918AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615250395;
	bh=Jc0xbvRQEdx73yP2N1jNE5s962DJcv4yekyLncfePxs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dvftmJ/N9pjirESK/TMBPECwDySXDrEL6VK266bMmUVuZnuh7nhf5bI3+rzSdeiEW
	 HAdIK2dH2rf4Pj0W0UwQcC5wL/CcrVn8qzqxQKboTsNVFvGbtQ0BTPvY78m7IvtZ/9
	 bQkOthEcm/m5ypa1wU7qE7Bd7CPTI6hthNnBV+b4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AC83F800D0;
	Tue,  9 Mar 2021 01:38:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71486F801D8; Tue,  9 Mar 2021 01:38:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA8DBF800D0
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 01:38:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA8DBF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="uRS5abBf"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iVHVoyvh"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4A7D12955;
 Mon,  8 Mar 2021 19:38:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 19:38:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=lZUbPH1WmAkC2U0YedM/gyCH7gf
 RmAx1NsZgcNXyxrQ=; b=uRS5abBfKBkMqYMkCpZ9PlHQoQm8qiR92G3sZzV8O11
 l13mhTIDML8G2cdBQq2OZZzef9QEjE/mhm54lCNsmDfFYM6I2wz3s0Hcg2mLa7xl
 +jimiA0GX3dEBiP+H816x4vfYKOr/wemBehRRbpWi+Kpm1+wEiogx+C91wFfFWp7
 Y0BP2I7DFJqHMqcM9k6vNxAzb6uxQu1fzvxtNkvaY0r7RtmENznvGRA0loH8jX6p
 G+2wUfl8Ht7vmepOESuqPLMmtBgxk0jLYgARH36zngo6y7cUIzbPDFZKCP0PDyj1
 njXc0WDqqhD5Cm5Bkxxl9AAqH8vp61zIBn1pforE2eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=lZUbPH
 1WmAkC2U0YedM/gyCH7gfRmAx1NsZgcNXyxrQ=; b=iVHVoyvhobJhuuNfgWiYtx
 YkUIaIIQwAcqrBFva+b3iL/AMuD/1GDiIHPMc9uroDRsWREt0vjJx3h2KfLU8oX6
 9XWBnY39lRqkLorJ776/B2fqeW6luj03etdQil+NpyB1OSV5BDu+9gDpc7aMD796
 P8xcwlJK4xB3L6a7Nl30c6F0mH1KlmJC6NrzNWqz0HiJQnYzexddLQs6qNM3yrly
 c6G0SINNnoWoAF3PJIrijnV3ShPfgO7IXlHWHvJXJMksqx+8Bu8Ilgli1VoTXef+
 d48qRSB0PwC0BKPfTNOPv+pWrXu2aPXiBa+4RpVJszJhQisEKP9jnmfG1dDGWejg
 ==
X-ME-Sender: <xms:bsNGYC5N8kxnLFIwhYGyh9RZG1MjS6KZLh5u6kdff1guGN2YEJ_p-Q>
 <xme:bsNGYL5M4MbUw_jpX21wlnrh1X9Y9OsVdAH-Abrr9FvGBBMKCC7bO_L4RtP_RrIxo
 Cc6e8x2tb03yCu0vQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduhedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnheplefhueegvd
 ejgfejgfdukeefudetvddtuddtueeivedttdegteejkedvfeegfefhnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:bsNGYBe5-6zQKtgiuCmvPgk1_vsqpaClY_2Ebu86j4ixfJW8notagg>
 <xmx:bsNGYPLkj6cc1Uh8QgdCzg3aqYH1-3kR_vJi_v5N5C0DmtgxeOhPdA>
 <xmx:bsNGYGKrUcdPT2bfOY2UUq6NdASFKYuYObuZuoL1EJ9DQQLpw0hzqA>
 <xmx:b8NGYFkZzntCEIUhrNoOfzmHOUdy8W_M3Sn8cSBelPpu3QFPMAeoWQ>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 31D56240067;
 Mon,  8 Mar 2021 19:38:06 -0500 (EST)
Date: Tue, 9 Mar 2021 09:38:03 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: alsa-lib's new API issue (snd_ctl_elem_id_compare)
Message-ID: <20210309003803.GA215306@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20210308125817.GA212288@workstation>
 <5e26625d-3db1-0600-47f8-057c0101d6b1@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e26625d-3db1-0600-47f8-057c0101d6b1@perex.cz>
Cc: alsa-devel@alsa-project.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Mar 08, 2021 at 03:33:46PM +0100, Jaroslav Kysela wrote:
> Dne 08. 03. 21 v 13:58 Takashi Sakamoto napsal(a):
> > My concerns are:
> > 
> > 1. evaluation of numid field is not covered.
> > 
> > This is not preferable since ALSA control core implementation covers two
> > types of comparison; numid only, and the combination iface, device,
> > subdevice, name, and index fields. If the API is produced for general use
> > cases, it should correctly handle the numid-only case, in my opinion.
> 
> My motivation was to allow to use this function for qsort() for example. The
> numid and full-field comparisons are two very different things.
 
Yep. I easily associated sort implementation in hcontrol API or simple
mixer API from your implementation

However, the new API is a part of control API and it just achieves things without
any supplemental information given from userspace implementation.

> > 2. tri-state return value is semantically inconsistent
> 
> It's correct for the sorting (strcmp like).
> 
> > The ID structure includes three types of values; integer, enumeration, and
> > string. In my opinion, tri-state return value from them has different meaning
> > each other.
> True, the signess is the key, the value should be ignored.
 
Semantically, comparability is different from equality. Even if we can find
ordered pair for integer values, we can not find any ordered pair for
enumeration and strings without programmer's arbitrariness. In short, we
can not see order in SNDRV_CTL_ELEM_IFACE_CARD and
SNDRV_CTL_ELEM_IFACE_HWDEP even if in C language enumeration is an alias
to integer value.

As long as ID structure for control element is compound structure with
several types of values, it's not worse to find comparability to it for
sorting purpose.

I wish you to follow specification described in ALSA control core and
UAPI to keep consistency against semantics of IDs for control element
in this subsystem when producing low-level control API.

> > The reason I post this message instead of posting any fix is that the fix
> > to the API affects to alsa-utils, in which the API is used by a patch you
> > applied a few days ago[2]. The patch also includes change to 'AM_PATH_ALSA'
> > declaration in configure.ac with bumped-up version to '1.2.5', and it
> > disables to rebuild alsa-utils on the latest toolchain. (alsa-lib 1.2.5 is
> > not released yet.)
> 
> The latest alsa-lib in the git repo is already set to 1.2.5pre1, so if you
> upgrade alsa-lib, everything should be fine. I was a bit lazy to write a
> configure test and add a wrapper to alsactl to support the older alsa-lib.

The laziness is preferable in the most cases in our work, however in the case 
it's worse. Everything is not fine, breaking things carelessly.

At a quick glance, you've introduced below APIs since v1.2.4 release.

 * int snd_config_get_card()
 * int snd_ctl_elem_id_compare()
 * void snd_ctl_elem_info_set_read_write()
 * void snd_ctl_elem_info_set_tlv_read_write()
 * void snd_ctl_elem_info_set_inactive()

One of the above, 'snd_ctl_elem_id_compare()' is just used by
alsa-utils, and the rest is not used fortunately. I'll post patch to
alsa-utils to get back alsa-lib compatibility to v1.0.27, or better
version number.

For the above comparison API, as I described, it's not appropriate. ID
structure for control element is not comparable, thus it should be dropped
or replaced with equality function such as 'snd_ctl_elem_id_equal()'.

When you need any sorting algorithms, it should be implemented in
application side or alsa-lib API in the other layer such as hcontrol and
simple mixer since control API should follow to specification of ALSA
control written in kernel land.


Thanks

Takashi Sakamoto
