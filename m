Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5EB23DB3B
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 16:49:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6FEA82E;
	Thu,  6 Aug 2020 16:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6FEA82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596725373;
	bh=0WxyG/OXUL7hHIZhxUq8Nvx7wBMS/PHpZJ32wwm9elY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q2oxMJFsiNwwso1PXy5L+mVIFrwfmouPvKNi5IQT5RE6ZZpbWtyNgckwUH876pZb2
	 pCQMsquMPLJBJDbU2LW0n7YGevhhNCHRYpC2kPwT1de91qeDc33K1YfGmivZhvuU0V
	 F7XQ6Ajb39QKYLhQKLIjRbR6UzGxGrAO9BmLEmlg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFB2AF80159;
	Thu,  6 Aug 2020 16:47:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD87FF80124; Thu,  6 Aug 2020 16:47:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5038BF80124;
 Thu,  6 Aug 2020 16:47:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5038BF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="H4UeDjVW"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="mgsjajeh"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 0F46B6C2;
 Thu,  6 Aug 2020 10:47:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 06 Aug 2020 10:47:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=W3E1GfXagR7jMmB5pYRLb2NZaUX
 TTaysdIUj3M3Wpt4=; b=H4UeDjVW4rinetO0ySUa/G4CHH7eROU1N/nIGKnO1TT
 aZPi+8QtqgUiRfpo3mgt1jzKlOkkZkDYJo1WN45vIjArupET1FRJcLC0wuTFPa/J
 o/Zw/7feplmd6VwQuixPEX+mblY65ovbYmjv0qXHRWD5T0iBBmki90U4/iXU7ru9
 YLmvx732IhdkfOcO/5C4Rlbz8mNO271m/6g0hzcHO4o0XiGgocS2OypIclK5FMSP
 TUCVX/4E6AVjDMpNIvaYaq3tpI+zCC4r8S482kt+aOgGSGfjsHrEbvoPIrNIiHN8
 MLKrPplnUo0rqixOLtl7jbHsfWnGYri1FAfjRvDuRPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=W3E1Gf
 XagR7jMmB5pYRLb2NZaUXTTaysdIUj3M3Wpt4=; b=mgsjajehYc3LhcTN/uQAAi
 dRgNpOs7cgWUhTehlH0J5G5yhO6P/+Qc4XTdPThD5jDnLqgKxAHswUS4IgI3MBAn
 ZPtdCbbg/RlsdVDcJV4Mb21nK7NehmvBwjf5n673SBUcwYNO1FSjQWEL6uc0/sG6
 UgVRSEp7bAeV1c3yOr1Zzv+XHzwVkgB/AFmaXIoZOSzpA9MIvJThjYMN3Wv4dULe
 mZw9WpGPY9Q9H7C4g4h8qXHfMzooGHqYanCkA4ycFY5zgz4qb30ItMcH3gyYN0/t
 A+vhccq5goJKPOQSYpVyUcPPeRbr0CZelxAK6m6s+sKVHcqnr2O4NJBx0lUsiV4w
 ==
X-ME-Sender: <xms:BRgsXySdfCl31wvQkRLtlWjqLdvUY2rDDAy6A_VEDjp9t5lIh1KYag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrkedtgdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
 dttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeejgeeifeeuve
 eufeeigeegjeelvdfgjeegffejgfdvkeelhefgtdefteejleekjeenucffohhmrghinhep
 khgvrhhnvghlrdhorhhgnecukfhppedukedtrddvfeehrdefrdehgeenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:BRgsX3xcY_yWJMn64Pv26bNzPv7d1GpZfkjMbirTYkgFxqctBV5d5A>
 <xmx:BRgsX_0gFn1KiQ6HYuKsypu_uq-RGVcGvRRjbD2ZpTgO71IWdHCOkA>
 <xmx:BRgsX-DFLjhEUwwxaDVhgBJ2x4UWj3Mc9EfOUHqr05uYi0PzwEf-6Q>
 <xmx:BhgsXzatpB9NLBopVwW1ky_bAqEwamwofsr0ajPvxrI2lYvK6S-c1g>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 167B330605C8;
 Thu,  6 Aug 2020 10:47:31 -0400 (EDT)
Date: Thu, 6 Aug 2020 23:47:29 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Tom Yan <tom.ty89@gmail.com>
Subject: Re: Why doesn't mixer control (values) have some kind of locking
 mechanism? (mutex?)
Message-ID: <20200806144729.GA381789@workstation>
Mail-Followup-To: Tom Yan <tom.ty89@gmail.com>, alsa-devel@alsa-project.org,
 alsa-user@alsa-project.org,
 pulseaudio-discuss@lists.freedesktop.org,
 pierre-louis.bossart@linux.intel.com
References: <CAGnHSEkpYqyZJjG587FSVUzYX2zV1tm83zj+uGjF4e24o4iAMA@mail.gmail.com>
 <20200806020601.GA6286@laptop>
 <CAGnHSEnMhF-1y7rL=JsmcFdTNVaA5ygv5N4TS9dhpORyOm+H_A@mail.gmail.com>
 <20200806091458.GA360003@workstation>
 <CAGnHSEkV9cpWoQKP1mT7RyqyTvGrZu045k=3W45Jm=mBidqDnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGnHSEkV9cpWoQKP1mT7RyqyTvGrZu045k=3W45Jm=mBidqDnw@mail.gmail.com>
Cc: alsa-devel@alsa-project.org, pulseaudio-discuss@lists.freedesktop.org,
 alsa-user@alsa-project.org, pierre-louis.bossart@linux.intel.com
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

On Thu, Aug 06, 2020 at 08:31:51PM +0800, Tom Yan wrote:
> Yeah I suppose a "full" lock would do. (That was what I was trying to
> point out. I don't really understand Pierre's message. I merely
> suppose you need some facility in the kernel anyway so that you can
> lock from userspace.) I hope that amixer the utility will at least have
> the capability to reschedule/wait by then though (instead of just
> "failing" like in your python demo).

As long as I know, neither tools in alsa-utils/alsa-tools nor pulseaudio
use the lock mechanism. In short, you are the first person to address
to the issue. Thanks for your patience since the first post in 2015.

> As for the compare-and-swap part, it's just a plus. Not that
> "double-looping" for *each* channel doesn't work. It just again seems
> silly and primitive (and was once confusing to me).

I prepare a rough kernel patch abount the compare-and-swap idea for
our discussion. The compare-and-swap is done under lock acquisition of
'struct snd_card.controls_rwsem', therefore many types of operations
to control element (e.g. read as well) get affects. This idea works
well at first when alsa-lib supports corresponding API and userspace
applications uses it. Therefore we need more work than changing just
in userspace.

But in my opinion, if things can be solved just in userspace, it should
be done with no change in kernel space.

======== 8< --------

From 54832d11b9056da2883d6edfdccaab76d8b08a5c Mon Sep 17 00:00:00 2001
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Thu, 6 Aug 2020 19:34:55 +0900
Subject: [PATCH] ALSA: control: add new ioctl request for compare_and_swap
 operation to element value

This is a rough implementation as a solution for an issue below. This is
not tested yet. The aim of this patch is for further discussion.

Typical userspace applications decide write value to control element
according to value read preliminarily. In the case, if multiple
applications begin a pair of read and write operations simultaneously,
the result is not deterministic without any lock mechanism. Although
ALSA control core has lock/unlock mechanism to a control element for
the case, the mechanism is not so popular. The mechanism neither not
used by tools in alsa-utils, alsa-tools, nor PulseAudio, at least.

This commit is an attempt to solve the case by introducing new ioctl
request. The request is a part of 'compare and swap' mechanism. The
applications should pass ioctl argument with a pair of old and new value
of the control element. ALSA control core read current value and compare
it to the old value under acquisition of lock. If they are the same,
the new value is going to be written at last.

Reported-by: Tom Yan <tom.ty89@gmail.com>
Reference: https://lore.kernel.org/alsa-devel/CAGnHSEkV9cpWoQKP1mT7RyqyTvGrZu045k=3W45Jm=mBidqDnw@mail.gmail.com/T/
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/uapi/sound/asound.h |  6 ++++
 sound/core/control.c        | 56 +++++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 535a7229e1d9..ff8d5416458d 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -1074,6 +1074,11 @@ struct snd_ctl_tlv {
 	unsigned int tlv[0];	/* first TLV */
 };
 
+struct snd_ctl_elem_compare_and_swap {
+	struct snd_ctl_elem_value old;
+	struct snd_ctl_elem_value new;
+};
+
 #define SNDRV_CTL_IOCTL_PVERSION	_IOR('U', 0x00, int)
 #define SNDRV_CTL_IOCTL_CARD_INFO	_IOR('U', 0x01, struct snd_ctl_card_info)
 #define SNDRV_CTL_IOCTL_ELEM_LIST	_IOWR('U', 0x10, struct snd_ctl_elem_list)
@@ -1089,6 +1094,7 @@ struct snd_ctl_tlv {
 #define SNDRV_CTL_IOCTL_TLV_READ	_IOWR('U', 0x1a, struct snd_ctl_tlv)
 #define SNDRV_CTL_IOCTL_TLV_WRITE	_IOWR('U', 0x1b, struct snd_ctl_tlv)
 #define SNDRV_CTL_IOCTL_TLV_COMMAND	_IOWR('U', 0x1c, struct snd_ctl_tlv)
+#define SNDRV_CTL_IOCTL_ELEM_COPARE_AND_SWAP	_IOWR('U', 0x1d, struct snd_ctl_elem_compare_and_swap)
 #define SNDRV_CTL_IOCTL_HWDEP_NEXT_DEVICE _IOWR('U', 0x20, int)
 #define SNDRV_CTL_IOCTL_HWDEP_INFO	_IOR('U', 0x21, struct snd_hwdep_info)
 #define SNDRV_CTL_IOCTL_PCM_NEXT_DEVICE	_IOR('U', 0x30, int)
diff --git a/sound/core/control.c b/sound/core/control.c
index aa0c0cf182af..0ac1f7c489be 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1684,6 +1684,60 @@ static int snd_ctl_tlv_ioctl(struct snd_ctl_file *file,
 	return -ENXIO;
 }
 
+static int snd_ctl_elem_compare_and_swap(struct snd_ctl_file *ctl_file,
+					 struct snd_ctl_elem_compare_and_swap *cas)
+{
+	struct snd_card *card = ctl_file->card;
+	// TODO: too much use on kernel stack...
+	struct snd_ctl_elem_value curr;
+	struct snd_ctl_elem_info info;
+	unsigned int unit_size;
+	int err;
+
+	info.id = cas->old.id;
+	err = snd_ctl_elem_info(ctl_file, &info);
+	if (err < 0)
+		return err;
+	if (info.type < SNDRV_CTL_ELEM_TYPE_BOOLEAN || info.type > SNDRV_CTL_ELEM_TYPE_INTEGER64)
+		return -ENXIO;
+	unit_size = value_sizes[info.type];
+
+	curr.id = cas->old.id;
+	err = snd_ctl_elem_read(card, &curr);
+	if (err < 0)
+		return err;
+
+	// Compare.
+	if (memcmp(&cas->old.value, &curr.value, unit_size * info.count) != 0)
+		return -EAGAIN;
+
+	// Swap.
+	return snd_ctl_elem_write(card, ctl_file, &cas->new);
+}
+
+static int snd_ctl_elem_compare_and_swap_user(struct snd_ctl_file *ctl_file,
+					      struct snd_ctl_elem_compare_and_swap __user *argp)
+{
+	struct snd_card *card = ctl_file->card;
+	struct snd_ctl_elem_compare_and_swap *cas;
+	int err;
+
+	cas = memdup_user(argp, sizeof(*cas));
+	if (IS_ERR(cas))
+		return PTR_ERR(cas);
+
+	err = snd_power_wait(card, SNDRV_CTL_POWER_D0);
+	if (err < 0)
+		goto end;
+
+	down_read(&card->controls_rwsem);
+	err = snd_ctl_elem_compare_and_swap(ctl_file, cas);
+	up_read(&card->controls_rwsem);
+end:
+	kfree(cas);
+	return err;
+}
+
 static long snd_ctl_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	struct snd_ctl_file *ctl;
@@ -1737,6 +1791,8 @@ static long snd_ctl_ioctl(struct file *file, unsigned int cmd, unsigned long arg
 		err = snd_ctl_tlv_ioctl(ctl, argp, SNDRV_CTL_TLV_OP_CMD);
 		up_write(&ctl->card->controls_rwsem);
 		return err;
+	case SNDRV_CTL_IOCTL_ELEM_COPARE_AND_SWAP:
+		return snd_ctl_elem_compare_and_swap_user(ctl, argp);
 	case SNDRV_CTL_IOCTL_POWER:
 		return -ENOPROTOOPT;
 	case SNDRV_CTL_IOCTL_POWER_STATE:
-- 
2.25.1

======== 8< --------

Thanks

Takashi Sakamoto
