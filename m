Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE9F21307A
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 02:36:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2490B16D0;
	Fri,  3 Jul 2020 02:35:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2490B16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593736580;
	bh=q5aPR6sAtQFLohXYq40mc1bA2FRo2j+sUQkEc2LDsmo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VDP0E0pumDd2euFEljzwO38Mt+tQK3K3CCTqbT0u7F+SaH4l7wItP3c5oJ88WEV+n
	 Ygl49/5qb5n6jkqDH2mbvcyAvAZJWKJtW71x3nTq5dKcG7lhkEswB361ROQSQRFSxA
	 D8WN/lvPFC9jzLDi0qf0/fu26Qi20xqL3jKA/+Lk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F454F80245;
	Fri,  3 Jul 2020 02:34:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7ADFF8022D; Fri,  3 Jul 2020 02:34:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43D5FF800ED
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 02:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43D5FF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="OOS3rKu5"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Rw61ltVO"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 6173551B;
 Thu,  2 Jul 2020 20:34:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 02 Jul 2020 20:34:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=x9DlxEkKyuFEsBYAk6vt9IseSJO
 B2twJyto2lfglpUU=; b=OOS3rKu5T5IMDdbyI4qKOAVyJYWkVNBIoa7K6SqhrZT
 9q0uSTHnxeRsUYym6/LzvVEUh13Yu1GEzF+4gZufUzEpQBSYE3NhAQoFhPciPkR7
 mAUFtMs/PJLY7vyh8k5lKkjEoJhJy/Pm/zy2VGN9R4HFLsXtkl+UE4ks6mffo9Ow
 5CkFMOXsDA/lmYIyZV8O8f1dPZLH8Sx0BVf2/rQlTAszigr3PM7Tyf5hngkbip0d
 0UcREclCJup5qy1beK6DUfBFhX0XCsgyEmcfR5CzRgcjXdXIGu8KeGxgIX/VldOz
 TAl7VwBz9lM8YnwuD0Mo7fWjfORoRfjSxpGu1ZHO/8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=x9DlxE
 kKyuFEsBYAk6vt9IseSJOB2twJyto2lfglpUU=; b=Rw61ltVODNYpqexYzhsA/8
 jK5Q6BYs2gc71KALzeVXdQUK5CLmd+nV4ugAEl0UTevnhQpSPheFoIPZcmo77IUT
 fAynDnfxYXPPBEuHpkA0PVsnhEczyedYY2OFWDmUpSzBy2deuw2SJ3339q1X7JRL
 ByIWa1qN/sq03tGEvTVTdduBNzoZJYJyQlZcyfolQBFYOrjSiC/PE2ZQtKGlnPVA
 8ObQ0WrqaZZ5SA9K/sLCo5ADQXRVXfB7XFfWQrYuN2kVykgMXpndL3cyajzv+cnx
 4APEXxSPfeL4ipuGUyHDX9uUG9ROy2Ahw8B83tfs4iqpTVawEfK255tYVJ/CtRmQ
 ==
X-ME-Sender: <xms:D33-Xr-Q3ihAtWZQ2MTZzVAZ9DKfGkKGwyA6vq0qiqn0cbC0Eeccrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdehgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnhepteevffdtfeeiudehkeeghfejuddufeeitdeiteeileej
 fedtkeegheettefhkeffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuh
 gsrdgtohhmpdhgihhtlhgrsgdrtghomhenucfkphepudektddrvdefhedrfedrheegnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkh
 grshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:D33-XntX2bYmziAwABUEYqQot1KvZ6SkIJSAWgt7DKt6eo9c30Yi0w>
 <xmx:D33-XpAZ52XnUJ160b1FDDmqV6gI10VFrPoqFeM-NH6D3z7AgtOB8A>
 <xmx:D33-XneuALrXNqqsh7MQQQKPeVxDUVKdBB_Os3iAYpOJn27pldhz6w>
 <xmx:EH3-Xma0gpkvPqTybex_xtHmPEFXUbkwkF0kwCDOd6vF5R1p9kDl0A>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id C3CC33060078;
 Thu,  2 Jul 2020 20:34:22 -0400 (EDT)
Date: Fri, 3 Jul 2020 09:34:20 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Tanjeff Moos <tanjeff@cccmz.de>
Subject: Re: How to identify Alsa eLements?
Message-ID: <20200703003420.GA349540@workstation>
Mail-Followup-To: Tanjeff Moos <tanjeff@cccmz.de>, alsa-devel@alsa-project.org
References: <3e46d988-d2f7-b06d-76e8-c8def2e870d1@cccmz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e46d988-d2f7-b06d-76e8-c8def2e870d1@cccmz.de>
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

On Thu, Jul 02, 2020 at 10:05:01PM +0200, Tanjeff Moos wrote:
> I'm programming a GUI for the mixer in my Focusrite Scarlett 6i6 interface.
> The Alsa driver supports that functionality, i.e. I can control the mixer
> using alsamixer, for example. Now I'm writing a Qt GUI for it.
> 
> I wonder how I can reliably identify a mixer control element (e.g. the
> master volume control). Each element has an ID (struct snd_ctl_elem_id),
> consisting of multiple elements:
> - numid (seems to change at each boot)
> - iface
> - device
> - subdevice
> - name (is always constant)
> - index
> The docs says I can identify an element by the combination of name and
> index.
> 
> My questions:
> 1) Are name and index enough to identify an element?

In ALSA control core, 'snd_ctl_find_id()' helper function[1] is used to
find control element set by the given information from userspace
application. You can see the algorithm supports two cases:

1. numid matching
2. the combination matching with:
  * iface
  * device
  * subdevice
  * name
  * index is within the range of set

As you know, the numid is not constant between every bootup since it's
assigned dynamically (see __snd_ctl_add_replace() helper function[2]).
Thus the way 2 is available in the case to hard-code in userspace
application.

> 2) How can I obtain the index? The name and numid are shown by 'amixer
>    contents', for example.

The amixer program uses 'snd_ctl_ascii_elem_id_get()' API in alsa-lib to
show identifier information. The API is programmed not to output the
index value if it equals to zero[3]. Potentially you can retrieve the
index value by a call of 'snd_ctl_elem_id_get_index()'.


Anyway, when using alsa-lib application for the purpose, you should pay
enough attention to which API is used since alsa-lib includes several
abstractions of API for control element set in each level:

 * Lower abstraction (snd_ctl_xxx)
 * Higher abstraction (snd_hctl_xxx)
 * Setup control interface (snd_sctl_xxx)
 * Mixer interface (snd_mixer_xxx)
   * Simple Mixer interface (snd_mixer_selem_xxx)

The configuration space of alsa-lib affects Setup control interface
and Mixer interface. On the other hand, it doesn't affect the
lower/higher abstraction. The amixer is a kind of application to use
'snd_hctl_xxx', 'snd_mixer_xxx', and 'snd_mixer_selem_xxx'.


When you'd like to communicate to kernel land implementation without any
effects of alsa-lib's configuration space. it's better to use the lower/higher
abstractions. As long as I've used, 'qashctl' in QasTools[4] is good GUI
application for this purpose. It's written with Qt5 and seems to be helpful
for your work in both of GUI programming and control elements handling.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/sound/core/control.c#n653
[2] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/sound/core/control.c#n338
[3] https://github.com/alsa-project/alsa-lib/blob/master/src/control/ctlparse.c#L110
[4] https://gitlab.com/sebholt/qastools


Regards

Takashi Sakamoto
