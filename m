Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 516EE30B359
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 00:21:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1A571764;
	Tue,  2 Feb 2021 00:20:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1A571764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612221706;
	bh=Z4d4N8/v3zjJzHkshDQbAJ+ak6QtKWSG5JFKnPnNwfM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JjmCu47Xl+D8vtgLHjiv2jPAIuQ3ace8INuwFI6r0SkkrkJC85Ar9MM9/TuD7JA7s
	 e0VNQT0QEWgrkkDkvFugd6fALpoDyRtu6D9oOXp/zeUBNxp5nly/0j7K2j2BoztZYc
	 kv2T/yDyeMus9pM3XmUOJ9F9VHUpbhhTF7jccI5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E66AF80155;
	Tue,  2 Feb 2021 00:20:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B1C9F80154; Tue,  2 Feb 2021 00:20:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEF26F80152
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 00:20:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEF26F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="NOAwJnm3"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id E0387A1570;
 Tue,  2 Feb 2021 00:20:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=ssfdkDmw6xak
 rwOPLgsefLQO8t7T2+/G9UIklxeWIDE=; b=NOAwJnm3djpRw7B3Z2J3EzeTW/U/
 SH+1zuzXql+yR7YTrw+/qGWPiQvz0aYOvH4GGuwdmfcrKcyDENOxTfCCqFvwJCEJ
 v13+6qI/tPZzYS2uRXqKRqJbNJhESGqXaxRq2Esq9R5gTlG89ZDRM1BHMAaGELZ5
 bBW1Jxx7lSklVzt3mu070UNG9YY+AoCdAVkN9MBez38CQ/NmLQgb0CuaXhY18uVT
 Vv2xCUn1U2ZD+L7I23me1NXVFbEIlNK8H+E0DOhMCnnd6EavKHZPGhXzR+/v7uKk
 iUuflU8H+9MJYMBV9fh8SUXny7ddh/IBd2bpmRnp4shSwpvHE7t5wMs0mw==
Subject: Re: [virtio-dev] Re: [PATCH v2 4/9] ALSA: virtio: build PCM devices
 and substream hardware descriptors
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
References: <20210124165408.1122868-1-anton.yakovlev@opensynergy.com>
 <20210124165408.1122868-5-anton.yakovlev@opensynergy.com>
 <6f93189c-7cfc-25c7-6b2c-ad8e21bf42c@intel.com>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <4eb2f618-1b8d-b339-8f85-ff061a1f563e@opensynergy.com>
Date: Tue, 2 Feb 2021 00:19:59 +0100
MIME-Version: 1.0
In-Reply-To: <6f93189c-7cfc-25c7-6b2c-ad8e21bf42c@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Cc: virtio-dev@lists.oasis-open.org, alsa-devel@alsa-project.org,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, virtualization@lists.linux-foundation.org
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



On 25.01.2021 16:44, Guennadi Liakhovetski wrote:
 > On Sun, 24 Jan 2021, Anton Yakovlev wrote:
 >

...[snip]...

 >>
 >> diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
 >> index 955eadc2d858..39fe13b43dd1 100644
 >> --- a/sound/virtio/virtio_card.c
 >> +++ b/sound/virtio/virtio_card.c
 >> @@ -92,6 +92,17 @@ static void virtsnd_event_notify_cb(struct
 >> virtqueue *vqueue)
 >>                       if (!event)
 >>                               break;
 >>
 >> +                     switch (le32_to_cpu(event->hdr.code)) {
 >> +                     case VIRTIO_SND_EVT_PCM_PERIOD_ELAPSED:
 >> +                     case VIRTIO_SND_EVT_PCM_XRUN: {
 >
 > In the previous patch you had a switch-case statement complying to the
 > common kernel coding style. It isn't specified in coding-style.rst, but
 > these superfluous braces really don't seem to be good for anything - in
 > this and multiple other switch-case statements in the series.

I will fix this. Thanks!


...[snip]...


 >> @@ -359,6 +384,8 @@ static int virtsnd_probe(struct virtio_device *vdev)
 >> static void virtsnd_remove(struct virtio_device *vdev)
 >> {
 >>       struct virtio_snd *snd = vdev->priv;
 >> +     struct virtio_pcm *pcm;
 >> +     struct virtio_pcm *pcm_next;
 >>
 >>       if (!snd)
 >>               return;
 >> @@ -376,6 +403,24 @@ static void virtsnd_remove(struct virtio_device
 >> *vdev)
 >>       vdev->config->reset(vdev);
 >>       vdev->config->del_vqs(vdev);
 >>
 >> +     list_for_each_entry_safe(pcm, pcm_next, &snd->pcm_list, list) {
 >> +             unsigned int i;
 >> +
 >> +             list_del(&pcm->list);
 >> +
 >> +             for (i = 0; i < ARRAY_SIZE(pcm->streams); ++i) {
 >> +                     struct virtio_pcm_stream *stream =
 >> &pcm->streams[i];
 >> +
 >> +                     if (stream->substreams)
 >> +                             devm_kfree(&vdev->dev, 
stream->substreams);
 >> +             }
 >> +
 >> +             devm_kfree(&vdev->dev, pcm);
 >
 > Please double-check both devm_kfree() calls above. Probably they aren't
 > needed in the .remove() method.

Then I will redo these parts, and the parts that you noticed in the rest
of the comments to this file.


...[snip]...


 >
 > Thanks
 > Guennadi
 >
 > ---------------------------------------------------------------------
 > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
 > For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
 >
 >
-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

www.opensynergy.com

