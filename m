Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2EA2EF3B7
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 15:08:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7E7516DC;
	Fri,  8 Jan 2021 15:07:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7E7516DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610114927;
	bh=KPkX8kJ3tSHutgLYt+oWXuKMd5SsWXmsa0u0bnwepbs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MAYE+ix5DCez65VDIsHSXn40qAZRRyGdspx7HhTmr0hgfW5qtfj92y0jQuJCoTWny
	 PuTXJw67aFv659rKNoq9tM66jflcieumeUEv+xRBYBZ1JiIXrso61ZfPlmyYx53nus
	 ZL0JUM/r/qNTWGObHQrJDrksgwyuWG0g0mUEB9ns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31997F80167;
	Fri,  8 Jan 2021 15:07:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02916F80166; Fri,  8 Jan 2021 15:07:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E13DF800FD
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 15:07:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E13DF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Hi7Pjvef"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="fN8TJbrO"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1A78D5C02F7;
 Fri,  8 Jan 2021 09:07:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 08 Jan 2021 09:07:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=FYLIlukazq6vAAkgiAm08ILg0O7
 KItJeyTfySSMx1OA=; b=Hi7Pjvefm/gf1FDgfd3OeT2eruUgje6wb8zLj8mOHqI
 3hPISCmFtpw+YdpikxPseam9/EJ45/V2n3Gfv1DTczC2xBxmHcF6wJgyOrOLs/dc
 avAynRQriAsIcEc1dGKjCf717e89v6tCejskXZFHJlIZNiJl9VrwFF9u2XdwT/jX
 v5I4AhPzN7Lu4Hyvpy+OcxJEf97d1UWCcvig1okVkYT0NpUrcAvxBaIO2l0LAiX7
 S4THB9DL2uFTwScuNfNg5srvs50nyRLuQYvgoQat9n+fl1hjkuIEyOeWdWqQeYRS
 GKU3lhCY/oHWh5PAqZk0NuJp3ZGX/dwPio1o4Amva7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=FYLIlu
 kazq6vAAkgiAm08ILg0O7KItJeyTfySSMx1OA=; b=fN8TJbrOS325USkuVg6sks
 DmNIkRvoimjGXqNm3B7vjoRNNMRoEjjv15MAMh5aNRkDdNR6FZWHS6/uJCBq+mNx
 q/0aPg+9lDviny1K+4GrFlIzD/fEUhdn5kb9VYnFgEZ+kk19c1xqKfBQ3AKSG1fG
 X0tdivaisNkkwCmPT8CKjOOq71CXzEd8i4OQC4EUGgCtkO/DQJthHwIBbKj4PfjL
 ks7BPetmQgD/55Jk02JW3QBkG8IIE8+WzpytC8ZmaYlox7XgjqvCXr/73yXtRKxe
 k8du9Dal1LuH1aNciZQBLNY8JaBjJkTZKP64CGG8Fi4f86de5FAUakEHuaWpADgQ
 ==
X-ME-Sender: <xms:Bmf4X8tr3lFKc2AxWn7o-ADW0rdYGAzLnO_nfDLXB-KE5u3UpHKl4A>
 <xme:Bmf4X5djpmHE-EiNgsj_IuDV6MDw2Sr8S71ExMVX-siPV1qzh7ytJDyIq14mxOcO9
 PSDnanDe8wuN5Kcr1o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeggedgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucfkphepuddukedrvdegfedrjeekrdehkeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:Bmf4X3xp5sk_9tdXlxIjmzxWJyw2y2eiFR_Vijp6pTTAQd2FMlr4_A>
 <xmx:Bmf4X_O9EwUjTVpSrvd0nrf_88vIfr70PFP2eEOTnmsKLIQ6NVsQWw>
 <xmx:Bmf4X8_2V_iSNN7YqZku9fLB3B9IRnplnwXQEObG3KJU8vtwVItxCw>
 <xmx:B2f4XxG6cI0P1629ZZBUnPvCeU_-sbPvo5ShzZuiQ5FmxrScFEknnA>
Received: from workstation (y078058.dynamic.ppp.asahi-net.or.jp
 [118.243.78.58])
 by mail.messagingengine.com (Postfix) with ESMTPA id 538AF240066;
 Fri,  8 Jan 2021 09:07:01 -0500 (EST)
Date: Fri, 8 Jan 2021 23:06:59 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [RFC PATCH 1/3] ALSA: control: add kcontrol_type to control
Message-ID: <20210108140659.GA44940@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20210108112355.2053917-1-jaska.uimonen@linux.intel.com>
 <20210108112355.2053917-2-jaska.uimonen@linux.intel.com>
 <1272f71c-c736-d267-563e-c2bf43b740da@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1272f71c-c736-d267-563e-c2bf43b740da@perex.cz>
Cc: alsa-devel@alsa-project.org, Jaska Uimonen <jaska.uimonen@linux.intel.com>
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

Hi,

On Fri, Jan 08, 2021 at 12:40:28PM +0100, Jaroslav Kysela wrote:
> Dne 08. 01. 21 v 12:23 Jaska Uimonen napsal(a):
> > Current kcontrol structs don't have a member to describe the control
> > type. The type is present in the widget which contains the control. As
> > there can be many controls in one widget it is inherently presumed that
> > the control types are the same.
> > 
> > Lately there has been use cases where different types of controls would
> > be needed for single widget. Thus enable this by adding the control type
> > to kcontrol and kcontrol_new structs.
> 
> It looks like a SoC only extension. Use private_data to carry this
> information. It has no value for the toplevel code.
> 
> 				Jaroslav

In current design of ALSA control core, the type of control element is
firstly determined by driver in callback of snd_kcontrol.info(). The
callback is done when userspace applications call ioctl(2) with
SNDRV_CTL_IOCTL_ELEM_INFO request.

The patch doesn't touch to the above processing. It means that the type
information is just for kernel-land implementation and is not exposed to
userspace application.

Essentially, driver is dominant to determine the type of control element
in control element set which the driver adds. It's possible to achieve
your intension without changing ALSA control core itself, in my opinion.

As Jaroslav said, it's better to change core of ALSA SoC part according
to your intention. If you'd like to change ALSA control core, I'd like
to request for the check of mismatch between the value of added member
in snd_kcontrol and the value of type of control element returned from
driver, like:

```
diff --git a/sound/core/control.c b/sound/core/control.c
index 809b0a62e..c3ae70574 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -973,6 +973,7 @@ static int __snd_ctl_elem_info(struct snd_card *card,
        result = kctl->info(kctl, info);
        if (result >= 0) {
                snd_BUG_ON(info->access);
+               snd_BUG_ON(info->type == kctl->kcontrol_type);
                index_offset = snd_ctl_get_ioff(kctl, &info->id);
                vd = &kctl->vd[index_offset];
                snd_ctl_build_ioff(&info->id, kctl, index_offset);
```


Regards

Takashi Sakamoto
