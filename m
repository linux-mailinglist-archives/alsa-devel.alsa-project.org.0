Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B278C301FD0
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 02:06:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57E09182E;
	Mon, 25 Jan 2021 01:57:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57E09182E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611536285;
	bh=U8PhnUfQT2B0CRQlMyujiNz00XzN1FXS6ifo91WBZeM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f5ye1+yOzKwYTi+o9+yow/LYZTnFPz8f7P1QC94qHMKurGmifLIyxMAj2yXIJ+cbU
	 8xqRpxitp9D4xkHz6cKI/ZghKSUNWWH6ORkwljna0VaWEsmw2hT4xULDE2nVoR2Ztt
	 W/qDMBd1rweQHe2t9Eex5cZZowepdSwBAKL9W53I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 888D0F801D8;
	Mon, 25 Jan 2021 01:56:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE46FF8015B; Mon, 25 Jan 2021 01:56:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 313B2F8012D
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 01:56:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 313B2F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="avph64br"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="U83xM3Dm"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 615A85C00E4;
 Sun, 24 Jan 2021 19:56:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 24 Jan 2021 19:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=tdsxi05pEmoinaFzjCa+cleNIH6
 jt6jkhF0ZVTXKZTQ=; b=avph64brzC+9pAq0Ph3qjUh3qDbvM/L0T5FAmYlV1Jj
 GNwu8lIFJSIQTve3jIsGdoCRUA2M8vkud018Cu2Xffw0f2I94FxABi4XulFWoFGs
 kRK96SHCqGkuouRB35AVmtO4ZT4lnmGKNkgSg2pcZsr8xss0PhaGBn68FAc+5xvH
 cHlZ0uAsoucTp27C7vG/HxW2D/d2PhoDQkDsViultce5AkUTcQ3P8OWQneiKh0pe
 1CeJV5HeUuBRqBRslRUUD/UQW25133KYjguyNHEkH/CvQAlh1nIpjQLHzBTYzknD
 NtephL42Tq+te7u4lz3WQXF6IQe6EpIPDsMF3vgfrAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=tdsxi0
 5pEmoinaFzjCa+cleNIH6jt6jkhF0ZVTXKZTQ=; b=U83xM3DmpTux0lCBoZM4lj
 hPavJlQoZ24t9I4VBL/55KTONrW7MO8cGqMgwrYa+TIUz4WULALEY7+wGpojWgxn
 LeSFH7NIWDYddoc2egROezXjP8pCbDFVzI4mDBodrT8ouLidEnQZ3odoJjVXwr2Q
 iBTcMiYjGyBsQmEjxiE5x0sDSD/X0pE/qdj0HbxcJKaxr/Hw/Hfz2UnY/8C2WEul
 tC02dfYx+rMLUmtGY62u/eHbcQXr+SR8gmtKth/xwA8fyLNpSLS4DWxVIdf1U2Oa
 YRv1zWC68SaOtDeupbYpRejzsu+tWCzzy+JQDo0Qr2LWU4K+mVMoc9Us2xlCtSYw
 ==
X-ME-Sender: <xms:NxcOYMzViOxcaJBkLMRjkrxNdPTM9kPUf0H2SXL9_btTy4U9Rbdb-g>
 <xme:NxcOYAdGsdpSxUzibLUm_pBgzyZ6yqVrBB7jpZMKni9mOc5eiq7eUeRLUuEW8Epdi
 GMLQO4OQmgUc08yc7I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvgddvjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnhepleefleeikeeiieevtdfffeeiheefhfdufeeiieffhfet
 ffefheefvdevuddugfdtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepud
 dukedrvdegfedrjeekrdehkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:NxcOYAJksyr_axRZkW92LA4lcUS6cmt6zfLV_25JMJP9RnetoBwnpg>
 <xmx:NxcOYJHe2THim_0Sp5OtYESCr9E3ntdYs3t4_CXo2JsOWZlpwDpFbA>
 <xmx:NxcOYCr1_YC6jEUurt6e1gIahht-A7zejXJ6vNG1BAqBHpxHAQUjkw>
 <xmx:OBcOYPsJesxAbyCoiRKM0Fq7GpuBrHqVwAD4_G4D6vhDpi-e9bxaIg>
Received: from workstation (y078058.dynamic.ppp.asahi-net.or.jp
 [118.243.78.58])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4B2341080057;
 Sun, 24 Jan 2021 19:56:22 -0500 (EST)
Date: Mon, 25 Jan 2021 09:56:19 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: control: expand limitation on the number of
 user-defined control element set per card
Message-ID: <20210125005619.GA137024@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, perex@perex.cz,
 alsa-devel@alsa-project.org
References: <20210122082032.103066-1-o-takashi@sakamocchi.jp>
 <s5h35yt83uf.wl-tiwai@suse.de>
 <20210123031025.GA118864@workstation>
 <s5h8s8k6mtf.wl-tiwai@suse.de>
 <20210124055225.GA132211@workstation>
 <s5ho8he6ah4.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5ho8he6ah4.wl-tiwai@suse.de>
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

On Sun, Jan 24, 2021 at 08:49:11AM +0100, Takashi Iwai wrote:
> On Sun, 24 Jan 2021 06:52:25 +0100,
> Takashi Sakamoto wrote:
> > 
> > Hi,
> > 
> > On Sat, Jan 23, 2021 at 10:10:20AM +0100, Takashi Iwai wrote:
> > > On Sat, 23 Jan 2021 04:10:25 +0100,
> > > Takashi Sakamoto wrote:
> > > > 
> > > > Hi,
> > > > 
> > > > On Fri, Jan 22, 2021 at 03:04:56PM +0100, Takashi Iwai wrote:
> > > > > On Fri, 22 Jan 2021 09:20:32 +0100,
> > > > > Takashi Sakamoto wrote:
> > > > > > 
> > > > > > ALSA control core allows usespace application to register control element
> > > > > > set by call of ioctl(2) with SNDRV_CTL_IOCTL_ELEM_ADD request. The added
> > > > > > control elements are called as 'user-defined'. Currently sound card has
> > > > > > limitation on the number of the user-defined control element set up
> > > > > > to 32.
> > > > > > 
> > > > > > The limitation is inconvenient to drivers in ALSA firewire stack since
> > > > > > the drivers expect userspace applications to implement function to
> > > > > > control device functionalities such as mixing and routing. As the
> > > > > > userspace application, snd-firewire-ctl-services project starts:
> > > > > > https://github.com/alsa-project/snd-firewire-ctl-services/
> > > > > > 
> > > > > > The project supports many devices supported by ALSA firewire stack. The
> > > > > > limitation is mostly good since routing and mixing controls can be
> > > > > > represented by control element set, which includes multiple control element
> > > > > > with the same parameters. Nevertheless, it's actually inconvenient to
> > > > > > device which has many varied functionalities. For example, plugin effect
> > > > > > such as channel strip and reverb has many parameters. For the case, many
> > > > > > control elements are required to configure the parameters and control
> > > > > > element set cannot aggregates them for the parameters. At present, the
> > > > > > implementations for below models requires more control element sets
> > > > > > than 32:
> > > > > > 
> > > > > >  * snd-bebob-ctl-service
> > > > > >    * Apogee Ensemble (31 sets for 34 elements)
> > > > > >  * snd-dice-ctl-service
> > > > > >    * TC Electronic Konnekt 24d (78 sets for 94 elements)
> > > > > >    * TC Electronic Studio Konnekt 48 (98 sets for 114 elements)
> > > > > >    * TC Electronic Konnekt Live (88 sets for 104 elements)
> > > > > >    * TC Electronic Impact Twin (70 sets for 86 elements)
> > > > > >    * Focusrite Liquid Saffire 56 (37 sets for 52 elements)
> > > > > > 
> > > > > > This commit expands the limitation according to requirement from the above
> > > > > > applications. As a result, userspace applications can add control element
> > > > > > sets up to 150 per sound card. It results in 154,200 user-defined control
> > > > > > elements as maximum since one control element set can include 1028 control
> > > > > > elements.
> > > > > 
> > > > > Thinking of this change again after reading your description, I find
> > > > > that a more flexible and safer approach would be to limit the number
> > > > > of total elements.  That is, count the number of items in each
> > > > > element, and set the max to (32 * MAX_CONTROL_COUNT).  This will keep
> > > > > the same max as the current implementation can achieve, while it
> > > > > allows more elements as long as they contain lower number of items.
> > > > > 
> > > > > So, something like below (totally untested).
> > > > > 
> > > > > 
> > > > > thanks,
> > > > > 
> > > > > Takashi
> > > > > 
> > > > > --- a/sound/core/control.c
> > > > > +++ b/sound/core/control.c
> > > > > @@ -18,10 +18,11 @@
> > > > >  #include <sound/info.h>
> > > > >  #include <sound/control.h>
> > > > >  
> > > > > -/* max number of user-defined controls */
> > > > > -#define MAX_USER_CONTROLS	32
> > > > >  #define MAX_CONTROL_COUNT	1028
> > > > >  
> > > > > +/* max number of user-defined controls */
> > > > > +#define MAX_USER_CONTROLS	(32 * MAX_CONTROL_COUNT)
> > > > > +
> > > > >  struct snd_kctl_ioctl {
> > > > >  	struct list_head list;		/* list of all ioctls */
> > > > >  	snd_kctl_ioctl_func_t fioctl;
> > > > > @@ -520,6 +521,7 @@ static int snd_ctl_remove_user_ctl(struct snd_ctl_file * file,
> > > > >  	struct snd_card *card = file->card;
> > > > >  	struct snd_kcontrol *kctl;
> > > > >  	int idx, ret;
> > > > > +	int count;
> > > > >  
> > > > >  	down_write(&card->controls_rwsem);
> > > > >  	kctl = snd_ctl_find_id(card, id);
> > > > > @@ -536,10 +538,11 @@ static int snd_ctl_remove_user_ctl(struct snd_ctl_file * file,
> > > > >  			ret = -EBUSY;
> > > > >  			goto error;
> > > > >  		}
> > > > > +	count = kctl->count;
> > > > >  	ret = snd_ctl_remove(card, kctl);
> > > > >  	if (ret < 0)
> > > > >  		goto error;
> > > > > -	card->user_ctl_count--;
> > > > > +	card->user_ctl_count -= count;
> > > > >  error:
> > > > >  	up_write(&card->controls_rwsem);
> > > > >  	return ret;
> > > > > @@ -1435,18 +1438,18 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
> > > > >  			return err;
> > > > >  	}
> > > > >  
> > > > > +	/* Check the number of elements for this userspace control. */
> > > > > +	count = info->owner;
> > > > > +	if (count == 0)
> > > > > +		count = 1;
> > > > > +
> > > > >  	/*
> > > > >  	 * The number of userspace controls are counted control by control,
> > > > >  	 * not element by element.
> > > > >  	 */
> > > > > -	if (card->user_ctl_count + 1 > MAX_USER_CONTROLS)
> > > > > +	if (card->user_ctl_count + count > MAX_USER_CONTROLS)
> > > > >  		return -ENOMEM;
> > > > >  
> > > > > -	/* Check the number of elements for this userspace control. */
> > > > > -	count = info->owner;
> > > > > -	if (count == 0)
> > > > > -		count = 1;
> > > > > -
> > > > >  	/* Arrange access permissions if needed. */
> > > > >  	access = info->access;
> > > > >  	if (access == 0)
> > > > > @@ -1535,7 +1538,7 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
> > > > >  	 * which locks the element.
> > > > >  	 */
> > > > >  
> > > > > -	card->user_ctl_count++;
> > > > > +	card->user_ctl_count += count;
> > > > >  
> > > > >   unlock:
> > > > >  	up_write(&card->controls_rwsem);
> > > > 
> > > > I have no objection to any change as long as it allows the service programs
> > > > to add control elements enough for target device. However, it's unclear
> > > > what is flexible and safe in the above patch.
> > > > 
> > > > When adding user-defined control element set, some objects are allocated
> > > > for below structures with some variable-length members:
> > > >  * struct snd_kcontrol (in include/sound/control.h)
> > > >  * struct user_element (in sound/core/control.h)
> > > > 
> > > > Current implementation is to avoid too much allocation for the above
> > > > against userspace applications with bugs or mis-programming. It's
> > > > reasonable to limit the allocation according to count of added control
> > > > element set for the purpose.
> > > > 
> > > > On the other hand, when counting the number of added control element for
> > > > the limitation, the above becomes loose. In the worst case, the patch
> > > > allows 32,896 sets to be allocated and against comments in my previous
> > > > patch.
> > > 
> > > OK, my previous patch was too simplified (I forgot to take the
> > > private_data into account), but the point is that what we want is to
> > > cap the worst case memory consumption.
> > > 
> > > If I calculate correctly, user_element is 320 bytes, and the value is
> > > up to 512 bytes for each item, and snd_kcontrol is 144 bytes, and
> > > snd_kcontrol_volatile is 16 bytes per item.  And each element may
> > > contain 1028 items.  So, the worst case scenario of the memory
> > > consumption is:
> > >   (320 + 512*1028 + 144 + 16*1024) * 32 = 17383936
> > > That is, currently we allow 16MB at most.
> > > 
> > > By increasing MAX_USER_CONTROLS to 150, it'll become 77MB.
> > > 
> > > And, think what if you'd need to increase more in future, e.g. 512
> > > elements.  The max consumption also increases linearly.
> > > 
> > > OTOH, imagine that we cap the memory consumption to 16MB instead of
> > > limiting only the MAX_USER_CONTROLS.  This lets user still allow to
> > > allocate more elements with smaller number of items (that is the
> > > common use case).  In this way, we don't take a risk of higher memory
> > > consumption while user can deploy the user elements more flexibly.
> > 
> > The memory object for data of Type-Length-Value style is underestimate in
> > your calculation for the worst case. For user-defined control element set,
> > the size is (1024 * 128) per control element set[1].
> > 
> > Of cource, it's possible to judge that usual userspace application don't
> > use data of Type-Length-Value style so much. However, we are assuming
> > the worst case now.
> 
> Right, that should be taken into account.
> 
> > ```
> > Objects linearly increased according to the number of user-defined control
> > element sets:
> >  * struct snd_kcontrol (144 bytes)
> >  * struct user_element (320 bytes)
> >  * data of TLV ((1024 * 128) bytes as maximum)
> > 
> > Objects linearly increased according to the number of control elements:
> >  * data of values (max. 1024 bytes in System V ABI with LP64 data type)
> >  * data of snd_kcontrol_volatile (16 bytes)
> > 
> > Memory consumption under current limitation:
> >  (144 + 320 + 1024 * 128) * 32 + (1024 + 16) * 1028 = 5,278,272
> > 
> > Scenario for the worst case when appying the patch:
> > * adding 32,896 control element sets
> >  * for elements: (1024 + 16) * 1028 * 32 = 34,211,840
> >  * for element sets: (144 + 320 + 1024 * 128) * 32896 = 4,327,008,256
> 
> Forget my previous patch.  The code change suggested there is
> obviously not sufficient, but you need only consider about its idea.
> 
> > Scenario for the worst case when applying my patch:
> > * adding 150 control element sets
> >  * for elements: (1024 + 16) * 1028 * 150 = 160,368,000
> >  * for element sets: (144 + 320 + 1024 * 128) * 150 = 19,730,400
> > ```
> 
> See that your patch increases the memory consumption so much?
> That's my point.
> 
> We may give more user elements without increasing the worst-case
> memory footprint in normal scenarios.  So scratch MAX_USER_CONTROLS
> but count each user element's memory consumption and define its total
> limit instead.

When preparing for safety, we should not assume anything as long as the
worst case is clear, in my opinion.

The initial maximum memory consumption is 5.2 MB. With limitation of
control element by control element, it's so large due to the data of TLV
per control element set. With limitation of control element set by control
element set, it's 19.7 MB and deterministic (in my patch).

It's can be investigated to arrange relevant parameters, but it
certainly brings regression to the old-versioned userspace applications.
It would not be better to change the size of data of TLV and the number
of control elements in control element set.

At first place, my request is to relax limitation according to userspace
application. Expansion of memory consumption is unavoidable. The linear
increase of memory consumption about which you mentioned is not so worse
as a result of compromise to the above.


Regards

Takashi Sakamoto
