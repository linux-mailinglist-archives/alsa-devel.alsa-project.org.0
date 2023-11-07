Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 736757E3800
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Nov 2023 10:42:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47F11210;
	Tue,  7 Nov 2023 10:41:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47F11210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699350158;
	bh=XM23lMTKqND0bNgsKr+sub55F+YcYI10LJZMFkTmWeg=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=vcMaZj5WmagEwhedryyiRA/GG5AypBRNdP5wiT2CcUEhKGa/vFOQMmnyVIEtH3DNm
	 6La/MF0B4ES+S/Xfys/A1e8GOu+JO1xCLH9zXWDSfQUyPHD1dd5faHOsHWi6W66k2C
	 s+5t2Ng0ZIKyExJTfxcAXXJMwZ0iHWBw5ieo7CQ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAAEBF8055B; Tue,  7 Nov 2023 10:41:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12B33F80169;
	Tue,  7 Nov 2023 10:41:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96B4BF8016D; Tue,  7 Nov 2023 10:41:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.1 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14FFAF800ED
	for <alsa-devel@alsa-project.org>; Tue,  7 Nov 2023 10:41:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14FFAF800ED
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D8C3CB811E3;
	Tue,  7 Nov 2023 09:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE9CC433C7;
	Tue,  7 Nov 2023 09:41:05 +0000 (UTC)
Message-ID: <0db3d822-9bfa-4efc-bf9d-3ae218b6815d@xs4all.nl>
Date: Tue, 7 Nov 2023 10:41:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v8 13/13] media: vim2m_audio: add virtual driver for
 audio memory to memory
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
References: <1698402948-10618-1-git-send-email-shengjiu.wang@nxp.com>
 <1698402948-10618-14-git-send-email-shengjiu.wang@nxp.com>
 <c7daf33d-9d6d-499e-b477-35176dbaca38@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <c7daf33d-9d6d-499e-b477-35176dbaca38@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CQCY5RLI64HPQLUIWZJSBWO263ZH3VRI
X-Message-ID-Hash: CQCY5RLI64HPQLUIWZJSBWO263ZH3VRI
X-MailFrom: SRS0=GhX7=GU=xs4all.nl=hverkuil@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CQCY5RLI64HPQLUIWZJSBWO263ZH3VRI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06/11/2023 14:58, Hans Verkuil wrote:
> On 27/10/2023 12:35, Shengjiu Wang wrote:
>> Audio memory to memory virtual driver use video memory to memory
>> virtual driver vim2m.c as example. The main difference is
>> device type is VFL_TYPE_AUDIO and device cap type is V4L2_CAP_AUDIO_M2M.
>>
>> The device_run function is a dummy function, which is simply
>> copy the data from input buffer to output buffer.
> 
> I started work on the v4l-utils part of this, using this driver.
> 
> I noticed that this driver doesn't expose the V4L2_CID_M2M_AUDIO_SOURCE/SINK_RATE
> controls, and it really should, otherwise it is not representative of this
> type of device.
> 
> It is enough to start with just a single fixed rate listed for each control.
> 
> It would be even nicer if you can have two rates such as 24000 and 48000 and
> do the actual rate conversion, i.e. dropping every other sample or duplicating
> each sample depending on whether you're halving or doubling the rate. That
> should be easy to implement, and it makes this driver much more realistic.

Update: I have finished the v4l-utils update (I'll post a patch for that later).

But while testing I noticed that this driver does not set up the sequence number
and it doesn't copy the timestamp. So the patch below needs to be applied.

Just squash it together with your patch. Note that you need to do the same for
your alsa driver.

Also, please rename the source name from vim2m_audio.c to vim2m-audio.c. That is
consistent with the naming elsewhere in test-drivers.

I also want to have support for the MEDIA_CONTROLLER here. See vim2m, search for
CONFIG_MEDIA_CONTROLLER. Both in this test driver and also in your audio driver.

This will require adding a new media entity (MEDIA_ENT_F_PROC_AUDIO_RESAMPLER?).
And you also need to add a new MEDIA_INTF_T_V4L_AUDIO interface type that will be
used by v4l2_m2m_register_media_controller(). That function can check vdev->vfl_type
to see if it needs to use MEDIA_INTF_T_V4L_VIDEO or MEDIA_INTF_T_V4L_AUDIO.
Remember to update the documentation as well!

The reason for using the media controller here is that it turns out to be very useful
for application to detect what sort of m2m device it is dealing with: it has proven
it worth for video codecs, and I think it should be standard for new m2m devices, and
especially for a completely new type of m2m device.

Regards,

	Hans

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/test-drivers/vim2m_audio.c b/drivers/media/test-drivers/vim2m_audio.c
index 2134e8338417..e8aa2bb0aa77 100644
--- a/drivers/media/test-drivers/vim2m_audio.c
+++ b/drivers/media/test-drivers/vim2m_audio.c
@@ -62,6 +62,7 @@ struct audm2m_q_data {
 	unsigned int		channels;
 	unsigned int		buffersize;
 	u32			fourcc;
+	unsigned int		sequence;
 };

 enum {
@@ -170,6 +171,9 @@ static void device_run(void *priv)

 	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+	src_buf->sequence = q_data_src->sequence++;
+	dst_buf->sequence = q_data_dst->sequence++;
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);

 	v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
 	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
@@ -423,6 +427,15 @@ static void audm2m_buf_queue(struct vb2_buffer *vb)
 	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
 }

+static int audm2m_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct audm2m_ctx *ctx = vb2_get_drv_priv(q);
+	struct audm2m_q_data *q_data = get_q_data(ctx, q->type);
+
+	q_data->sequence = 0;
+	return 0;
+}
+
 static void audm2m_stop_streaming(struct vb2_queue *q)
 {
 	struct audm2m_ctx *ctx = vb2_get_drv_priv(q);
@@ -442,6 +455,7 @@ static void audm2m_stop_streaming(struct vb2_queue *q)
 static const struct vb2_ops audm2m_qops = {
 	.queue_setup	 = audm2m_queue_setup,
 	.buf_queue	 = audm2m_buf_queue,
+	.start_streaming  = audm2m_start_streaming,
 	.stop_streaming  = audm2m_stop_streaming,
 	.wait_prepare	 = vb2_ops_wait_prepare,
 	.wait_finish	 = vb2_ops_wait_finish,

