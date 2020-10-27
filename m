Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 285A729A272
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 02:58:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDEF616A6;
	Tue, 27 Oct 2020 02:57:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDEF616A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603763889;
	bh=mxNShNhAIvSpy4QRabbT7u02Dj4/c2UxLu6OSibhkII=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mCTzOkZJkZG+gcmSZSI6Fl2GNpVjC8PM0mks5C0HLyj2LTv5VdKQfqB2jh2SKC4UG
	 vWq/JAdP8cNvcCjmtO268yQZ0qfZIm5WuzXwOgwWCG5xcCm+ZN9lye5PXmiFroiEQ5
	 AaUC7qu40fZpLVnF4GTR8QmsvGtZp8zWpu/1QChg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C5E7F80249;
	Tue, 27 Oct 2020 02:56:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 308D7F80212; Tue, 27 Oct 2020 02:56:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02AF0F80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 02:56:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02AF0F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="mm7a2njx"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20201027015623epoutp04564e5b699213fb9cffe880200dfa2d34~Btqn6e-mU2032920329epoutp04C
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 01:56:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20201027015623epoutp04564e5b699213fb9cffe880200dfa2d34~Btqn6e-mU2032920329epoutp04C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1603763783;
 bh=5nQrHKXu5DX515Qm56H5VmibxElAyIymM+YQcd/OW94=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=mm7a2njxi/mRKn48bBZPitr1z9C8+0PbdzNSjBhimw58yFufJaUS9gHnbljTBwruf
 4ikF+/6+IWB/GgA/63DSiG7gRmQ8PxyrUnBe/n0YLNxhMcIGCgs35bVk8xGMGcJERh
 ZZy+WbvDaQgpiUZ/s0mDLVcnzVixuKBVeswLug0Y=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20201027015622epcas2p1f88d70ad5b42e29c67889ddcc642a06d~BtqnMHRmf0590805908epcas2p1g;
 Tue, 27 Oct 2020 01:56:22 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.186]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4CKvv80WXgzMqYm6; Tue, 27 Oct
 2020 01:56:20 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 FA.BD.09908.34E779F5; Tue, 27 Oct 2020 10:56:19 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20201027015619epcas2p3c669677072d56e2426dc1151f9b7f9bc~BtqkPOsbr0120201202epcas2p3t;
 Tue, 27 Oct 2020 01:56:19 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201027015619epsmtrp291299cf870bd9a8d99621c8d68d55699~BtqkOcpTW3259732597epsmtrp2Q;
 Tue, 27 Oct 2020 01:56:19 +0000 (GMT)
X-AuditID: b6c32a48-139ff700000026b4-44-5f977e43e365
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 28.C9.08604.34E779F5; Tue, 27 Oct 2020 10:56:19 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20201027015619epsmtip2b43ec90fc81c9bd6bccb24d05251982b~Btqj-sg060156901569epsmtip2N;
 Tue, 27 Oct 2020 01:56:19 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Takashi Iwai'" <tiwai@suse.de>
In-Reply-To: <s5h5z6w53bm.wl-tiwai@suse.de>
Subject: RE: [PATCH] ALSA: compress: allow pause and resume during draining
Date: Tue, 27 Oct 2020 10:56:19 +0900
Message-ID: <000401d6ac04$5cf67270$16e35750$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFYfkYlW14yIW5U9SNXNoYFWW92AgKTudZwAbYfV/gDH6isoAKHE7a9AdRQf28BYefddgKT6KNVAgBXeBkClq6mqAEeV+jFAljo6UsBqsh+KQIAfJ5tAba34gUBunORDwHIvLbUAmbN6gUBXdZUN6mDbcoQ
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFJsWRmVeSWpSXmKPExsWy7bCmha5z3fR4g5PzjSyuXDzEZDFjWzeL
 ReO9CWwWq69uYbL4dqWDyeLX/2dMFkcvLmayaLjbzG6x4ftaRouXm98wWRxpnMJksfPOCWYH
 Ho8Nn5vYPHbOusvusWlVJ5vHvJOBHn1bVjF6rN9ylcVj8+nqAPaoHJuM1MSU1CKF1Lzk/JTM
 vHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoEOVFMoSc0qBQgGJxcVK+nY2Rfml
 JakKGfnFJbZKqQUpOQWGhgV6xYm5xaV56XrJ+blWhgYGRqZAlQk5GS+nH2IvOCBQ8XK+XgPj
 Ut4uRk4OCQETiWM7Ohm7GLk4hAR2MErsuPuKGcL5xChxZPsXdgjnG6PEhmezmGBa7p59wQSR
 2MsoMfv6QWaQhJDAS0aJdzf9QWw2AV2JL/fugMVFBFQknvauA2tgFjjCJPHtwWt2kASngLbE
 kcZ9YLawgLfEz6OfGEFsFgFViflbz4PFeQUsJZ5cv8gCYQtKnJz5BMxmFpCX2P52DjPERQoS
 P58uYwVZICKwilFib+9lVogiEYnZnW1gD0kInOCQ+HV2AiNEh4vEvR93of4Rlnh1fAs7hC0l
 8fndXjaIhmagd87+gUpMYZTo7BaCsI0ltsw9BdTMAbRBU2L9Ln0QU0JAWeLILajj+CQ6Dv9l
 hwjzSnS0QTUqSWw89Y8JIiwhMW8D+wRGpVlIPpuF5LNZSB6YhbBqASPLKkax1ILi3PTUYqMC
 E+TI3sQITsRaHjsYZ7/9oHeIkYmD8RCjBAezkgjvHJmp8UK8KYmVValF+fFFpTmpxYcYTYFh
 PZFZSjQ5H5gL8kriDU2NzMwMLE0tTM2MLJTEeUNX9sULCaQnlqRmp6YWpBbB9DFxcEo1MFXs
 KqlmeS/UvtBu6wsDTeYU9bzbrP1fdyW1fxZLuVRl8dhU+MnRx6+VOC2zb2Q82CR//1Kd97PJ
 7fPWvfmdFBqddOrlhgMxQXUdyjzCtfV6X6+0GGdnHdzhvHvjXHf25T73UuaFVP6wj/4272+A
 yWmFlZGCM08ICO8tO+iyN/WEeVbP88LChp/120KT8jdseRwmUTynVGxf/qYKd/1lcjdfnks3
 PH3mJo/7J4ZXnJvqX75VkG1d1Xc/t69D9mdtociUEzayJ5RUj7ftcLi/YdPUyw/5Wm64lweo
 LOD8eWZeT9hkkyh+d5Nwpz/RJ2zjVh1+ZNF+8vSuv7FLWOwqJI6ca9ZOlr/09Lvh6Z7FXkos
 xRmJhlrMRcWJALDpbmNNBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsWy7bCSvK5z3fR4g89bJC2uXDzEZDFjWzeL
 ReO9CWwWq69uYbL4dqWDyeLX/2dMFkcvLmayaLjbzG6x4ftaRouXm98wWRxpnMJksfPOCWYH
 Ho8Nn5vYPHbOusvusWlVJ5vHvJOBHn1bVjF6rN9ylcVj8+nqAPYoLpuU1JzMstQifbsEroyX
 0w+xFxwQqHg5X6+BcSlvFyMnh4SAicTdsy+Yuhi5OIQEdjNKfO17xgyRkJD4MP8MO4QtLHG/
 5QgrRNFzRonVvzazgCTYBHQlvty7A9YgIqAi8bR3HdgkZoELTBL7j75nhOhYwibRM/kIG0gV
 p4C2xJHGfWBjhQW8JX4e/cQIYrMIqErM33oeLM4rYCnx5PpFFghbUOLkzCdgNrOAnsT69XMY
 IWx5ie1v50CdqiDx8+kysPNEBFYxSuztvcwKUSQiMbuzjXkCo/AsJLNmIZk1C8msWUhaFjCy
 rGKUTC0ozk3PLTYsMMxLLdcrTswtLs1L10vOz93ECI5LLc0djNtXfdA7xMjEwXiIUYKDWUmE
 d47M1Hgh3pTEyqrUovz4otKc1OJDjNIcLErivDcKF8YJCaQnlqRmp6YWpBbBZJk4OKUamNJv
 fFE88FLKa6vXARH7kLMmAfqT7yy8nNDGE10o8c/xp88trUfTuno3bZCbvSE7TO9GwLIdLWdy
 pfdlyQlvFLlbc+G/iVWPbbm6naN1xC0Ly0XSgrLzRCoc995+xrvGfXrtnqa25d728WJRTatl
 Xm9/v/aTRZ8fy4X+HvW1ThbHL0cbbn5b/5FrOWPs4ZLGGAbO4CVLMz4e+Jeg+F/zYvTUKa/k
 j6n3le98fLH1xqQoqxTb2U1HCgSP7hZ6zvs6OqJ24/2lvYXVbY+FlpwOMU/fom57dqOBXaNn
 4pbb8tYXs5k2MEyMf7Xo8NEt3s/bvKe/+fInmbczstF7otjCRV+WRojeXvJkNRPb3EtP2pVY
 ijMSDbWYi4oTAcQNCWg6AwAA
X-CMS-MailID: 20201027015619epcas2p3c669677072d56e2426dc1151f9b7f9bc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201012150106epcas2p23aa4b65b1b23cf8e15680554f9a0d7e4
References: <20201006062105.GQ2968@vkoul-mobl>
 <4bbc385b-d35a-8766-7981-034455287225@linux.intel.com>
 <000d01d69d58$4e2db6f0$ea8924d0$@samsung.com> <s5hr1q7sa9f.wl-tiwai@suse.de>
 <831bbfcf-9720-9100-8633-65932b415cab@perex.cz>
 <s5ha6wusb2l.wl-tiwai@suse.de> <20201012052525.GH2968@vkoul-mobl>
 <s5hk0vwq65o.wl-tiwai@suse.de> <20201012122423.GJ2968@vkoul-mobl>
 <5b26cdd5-8a15-fa26-86af-13bfbfad5341@perex.cz>
 <20201012135540.GK2968@vkoul-mobl>
 <777e0046-1e3a-e702-c070-cac4c0525ccd@perex.cz>
 <s5hh7qzplsb.wl-tiwai@suse.de>
 <0afa7a39-84d5-0b9b-5453-8e7848a30bb6@perex.cz>
 <CGME20201012150106epcas2p23aa4b65b1b23cf8e15680554f9a0d7e4@epcas2p2.samsung.com>
 <s5ha6wrpk1t.wl-tiwai@suse.de> <000001d6a2e0$8e6f4840$ab4dd8c0$@samsung.com>
 <001801d6ab78$fcfe0760$f6fa1620$@samsung.com> <s5h5z6w53bm.wl-tiwai@suse.de>
Cc: 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, khw0178.kim@samsung.com, kimty@samsung.com,
 tiwai@suse.com, lgirdwood@gmail.com, 'Vinod Koul' <vkoul@kernel.org>,
 hmseo@samsung.com, s47.kang@samsung.com, pilsun.jang@samsung.com,
 tkjung@samsung.com
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

On Mon, 26 Oct 2020 18:01:33 +0100, Takashi Iwai wrote:
>On Mon, 26 Oct 2020 10:18:38 +0100,
>Gyeongtaek Lee wrote:
>> 
>> With a stream with low bitrate, user can't pause or resume the stream
>> near the end of the stream because current ALSA doesn't allow it.
>> If the stream has very low bitrate enough to store whole stream into
>> the buffer, user can't do anything except stop the stream and then
>> restart it from the first because most of applications call draining
>> after sending last frame to the kernel.
>> If pause, resume are allowed during draining, user experience can be
>> enhanced.
>> To prevent malfunction in HW drivers which don't support pause
>> during draining, pause during draining will only work if HW driver
>> enable this feature explicitly by calling
>> snd_compr_use_pause_in_draining().
>> 
>> Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
>> Cc: stable@vger.kernel.org
>
>Could you restart the new thread?  It's been hanging too deeply and
>hard to read through.
>
>Since it's the revised patch, please give the revision number (v2 or
>such) and show what's different from the previous patches.
>
Ok. I'll send the patch again with [PATCH v2] prefix.
>About the changes:
>
>> +/**
>> + * snd_compr_use_pause_in_draining - Allow pause and resume in draining state
>> + * @substream: compress substream to set
>> + *
>> + * Allow pause and resume in draining state.
>> + * Only HW driver supports this transition can call this API.
>> + */
>> +static inline void snd_compr_use_pause_in_draining(
>> +					struct snd_compr_stream *substream)
>> +{
>> +	substream->device->use_pause_in_draining = true;
>> +}
>
>How to set the flag is an open question.  A natural way would be to
>set it somehow at creating the component object, but currently there
>seems no way to pass any flags.
Could you explain more about what is your concerning?
For me, calling snd_compr_use_pause_in_draining() in open() callback of 
snd_compr_ops was good enough.
I've tested it and it worked well on linux 5.4.
>
>
>thanks,
>
>Takashi
>

