Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2C930128A
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Jan 2021 04:12:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C76211E91;
	Sat, 23 Jan 2021 04:11:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C76211E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611371539;
	bh=qe7QZJtrmoAdVco+3ugLu3Q4gY2PBjlRtY32FZIdpZs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R3Jkt+Kifp3TfoVGxXpneuMRZ/2ghLuf/co+6llEU4OeJtwTi3OYbtWrn+HXQh1Ng
	 UQMNrzV6QyRk1EZLxuswyokRUl/eBFLrKDm+rLnIrYN+dsLKzz5vF45nIqJzZ9yZPh
	 tjfJfbKgN4p2Gn6PWIirhIEkHG9fZSU0T6Ytiaw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7D1DF8026A;
	Sat, 23 Jan 2021 04:10:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 975E6F80257; Sat, 23 Jan 2021 04:10:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D92A1F80083
 for <alsa-devel@alsa-project.org>; Sat, 23 Jan 2021 04:10:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D92A1F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="PUxFIkEq"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="J5Q4cMVE"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4CE425C00FF;
 Fri, 22 Jan 2021 22:10:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 22 Jan 2021 22:10:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=FCsenjc1JGO4hJQ9g+n0ecfO9Cg
 L5SctKLJG/5kbOPQ=; b=PUxFIkEqiJkJZ9EqrbkpR9LIR+TgEj+RBwA1MG71VBU
 UjHDqU0mO439ig/GOP0s7f/toLdwJwhjJ9ckT8xOGLwLyfB54PH2Q77D040lMssF
 BI4U2zigz2cw6JL9/kBL3Q1AS3L/Vttx8haH93aMHN/aFHqa1C9sk5Bb8G+dwO0Y
 twiNkrWEtkrrJu2o/APWezULcmbS1x8rYVyCXFV5nYOKm+BxBT2+7723QTrFof9i
 VJs1Ou6Hrme6Xc22TkC+aUZsS66wlRudBxLEMd8VwVy9x4XPMXEhVKQsemo1XFhr
 tajsixMF5fCluriyllE5wbKOBB0MbzeFGLJKfeVifAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=FCsenj
 c1JGO4hJQ9g+n0ecfO9CgL5SctKLJG/5kbOPQ=; b=J5Q4cMVEeJVMHhPsEjWmsl
 bA+51BRM4oZnIo/7yq0V8X14OU1478Qfl6Xq6LXRjUEvZJS5cxbyTRh1tPCWRifp
 jcIj48QKqUl47P9Qc3mojFn+47A9bC01XTmkgb1cvY8a8sh/XfHyIuheSC2mw2y0
 OikacbTqDXeb9DXZIWx+lFKTxZsLxY1oeMxajyj2IF6wX7r1Wc+w+P9WWcG4QPm8
 hV5kUA6FJyke2/XiDy9PbDIi2hfTSVjve077RtrI7Ib7SDMio6Bf4RLgJ+F60jBi
 UXKyFYNXWR2FFhpG73mYFZPaFZeb+k4aNsDklHqs0QbY9UFs78pDZCuxEkC/IAzg
 ==
X-ME-Sender: <xms:pZMLYIFuGc8wX06qYArZiUDKaBel5GP4-MUor_ZvPWVlX0jLir4M4g>
 <xme:pZMLYBUP_gtK6W2r8b0dyPsxKkD7wITvdPfMV0BoWJybkkSYfE_QuK_0eb3eqyvik
 7Ddro0_2Lv3nV3cZOY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejgdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnhepleefleeikeeiieevtdfffeeiheefhfdufeeiieffhfet
 ffefheefvdevuddugfdtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepud
 dukedrvdegfedrjeekrdehkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:pZMLYCKidXHCvO7VT6ggpiHRXFWdqZC4sf4O7lr3orE9Yb9tMcxINA>
 <xmx:pZMLYKEA_DYIUe34q0snx3gySrsmAgEZRNB_3zceOQIMRqh11oAX0w>
 <xmx:pZMLYOWujECdf6UEQUgJPVQESGhAmAT7ro9oxcLbss4JBF0j4t-umQ>
 <xmx:ppMLYHchFGUsMJeXA5Nppo8ly44U-YVaiVMzPUxiU-TAJIPGPJM4SA>
Received: from workstation (y078058.dynamic.ppp.asahi-net.or.jp
 [118.243.78.58])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8EC3624005B;
 Fri, 22 Jan 2021 22:10:28 -0500 (EST)
Date: Sat, 23 Jan 2021 12:10:25 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: control: expand limitation on the number of
 user-defined control element set per card
Message-ID: <20210123031025.GA118864@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, perex@perex.cz,
 alsa-devel@alsa-project.org
References: <20210122082032.103066-1-o-takashi@sakamocchi.jp>
 <s5h35yt83uf.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h35yt83uf.wl-tiwai@suse.de>
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

Hi,

On Fri, Jan 22, 2021 at 03:04:56PM +0100, Takashi Iwai wrote:
> On Fri, 22 Jan 2021 09:20:32 +0100,
> Takashi Sakamoto wrote:
> > 
> > ALSA control core allows usespace application to register control element
> > set by call of ioctl(2) with SNDRV_CTL_IOCTL_ELEM_ADD request. The added
> > control elements are called as 'user-defined'. Currently sound card has
> > limitation on the number of the user-defined control element set up
> > to 32.
> > 
> > The limitation is inconvenient to drivers in ALSA firewire stack since
> > the drivers expect userspace applications to implement function to
> > control device functionalities such as mixing and routing. As the
> > userspace application, snd-firewire-ctl-services project starts:
> > https://github.com/alsa-project/snd-firewire-ctl-services/
> > 
> > The project supports many devices supported by ALSA firewire stack. The
> > limitation is mostly good since routing and mixing controls can be
> > represented by control element set, which includes multiple control element
> > with the same parameters. Nevertheless, it's actually inconvenient to
> > device which has many varied functionalities. For example, plugin effect
> > such as channel strip and reverb has many parameters. For the case, many
> > control elements are required to configure the parameters and control
> > element set cannot aggregates them for the parameters. At present, the
> > implementations for below models requires more control element sets
> > than 32:
> > 
> >  * snd-bebob-ctl-service
> >    * Apogee Ensemble (31 sets for 34 elements)
> >  * snd-dice-ctl-service
> >    * TC Electronic Konnekt 24d (78 sets for 94 elements)
> >    * TC Electronic Studio Konnekt 48 (98 sets for 114 elements)
> >    * TC Electronic Konnekt Live (88 sets for 104 elements)
> >    * TC Electronic Impact Twin (70 sets for 86 elements)
> >    * Focusrite Liquid Saffire 56 (37 sets for 52 elements)
> > 
> > This commit expands the limitation according to requirement from the above
> > applications. As a result, userspace applications can add control element
> > sets up to 150 per sound card. It results in 154,200 user-defined control
> > elements as maximum since one control element set can include 1028 control
> > elements.
> 
> Thinking of this change again after reading your description, I find
> that a more flexible and safer approach would be to limit the number
> of total elements.  That is, count the number of items in each
> element, and set the max to (32 * MAX_CONTROL_COUNT).  This will keep
> the same max as the current implementation can achieve, while it
> allows more elements as long as they contain lower number of items.
> 
> So, something like below (totally untested).
> 
> 
> thanks,
> 
> Takashi
> 
> --- a/sound/core/control.c
> +++ b/sound/core/control.c
> @@ -18,10 +18,11 @@
>  #include <sound/info.h>
>  #include <sound/control.h>
>  
> -/* max number of user-defined controls */
> -#define MAX_USER_CONTROLS	32
>  #define MAX_CONTROL_COUNT	1028
>  
> +/* max number of user-defined controls */
> +#define MAX_USER_CONTROLS	(32 * MAX_CONTROL_COUNT)
> +
>  struct snd_kctl_ioctl {
>  	struct list_head list;		/* list of all ioctls */
>  	snd_kctl_ioctl_func_t fioctl;
> @@ -520,6 +521,7 @@ static int snd_ctl_remove_user_ctl(struct snd_ctl_file * file,
>  	struct snd_card *card = file->card;
>  	struct snd_kcontrol *kctl;
>  	int idx, ret;
> +	int count;
>  
>  	down_write(&card->controls_rwsem);
>  	kctl = snd_ctl_find_id(card, id);
> @@ -536,10 +538,11 @@ static int snd_ctl_remove_user_ctl(struct snd_ctl_file * file,
>  			ret = -EBUSY;
>  			goto error;
>  		}
> +	count = kctl->count;
>  	ret = snd_ctl_remove(card, kctl);
>  	if (ret < 0)
>  		goto error;
> -	card->user_ctl_count--;
> +	card->user_ctl_count -= count;
>  error:
>  	up_write(&card->controls_rwsem);
>  	return ret;
> @@ -1435,18 +1438,18 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
>  			return err;
>  	}
>  
> +	/* Check the number of elements for this userspace control. */
> +	count = info->owner;
> +	if (count == 0)
> +		count = 1;
> +
>  	/*
>  	 * The number of userspace controls are counted control by control,
>  	 * not element by element.
>  	 */
> -	if (card->user_ctl_count + 1 > MAX_USER_CONTROLS)
> +	if (card->user_ctl_count + count > MAX_USER_CONTROLS)
>  		return -ENOMEM;
>  
> -	/* Check the number of elements for this userspace control. */
> -	count = info->owner;
> -	if (count == 0)
> -		count = 1;
> -
>  	/* Arrange access permissions if needed. */
>  	access = info->access;
>  	if (access == 0)
> @@ -1535,7 +1538,7 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
>  	 * which locks the element.
>  	 */
>  
> -	card->user_ctl_count++;
> +	card->user_ctl_count += count;
>  
>   unlock:
>  	up_write(&card->controls_rwsem);

I have no objection to any change as long as it allows the service programs
to add control elements enough for target device. However, it's unclear
what is flexible and safe in the above patch.

When adding user-defined control element set, some objects are allocated
for below structures with some variable-length members:
 * struct snd_kcontrol (in include/sound/control.h)
 * struct user_element (in sound/core/control.h)

Current implementation is to avoid too much allocation for the above
against userspace applications with bugs or mis-programming. It's
reasonable to limit the allocation according to count of added control
element set for the purpose.

On the other hand, when counting the number of added control element for
the limitation, the above becomes loose. In the worst case, the patch
allows 32,896 sets to be allocated and against comments in my previous
patch.


Regards

Takashi Sakamoto
