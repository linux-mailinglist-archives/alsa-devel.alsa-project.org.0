Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 699F182A851
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jan 2024 08:29:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7D96E69;
	Thu, 11 Jan 2024 08:29:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7D96E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704958156;
	bh=RdUCj1CNwLJ/uGrmIGaELXyjiQfNSahsy039QzHrr0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mr1+91CcROH47MK0pxZOHBnZ9auKNw9sq3IG25aMqQuBrYnnRJvMOC/IXvt5Qedzl
	 SweJFatqHvzTGxmEoPC9zp9YuOmiTDweJPJ/RSP3nXXtNb7/+493Qa9HaWmtKQ/F9E
	 nQ9XDhQNHzz/okYhcWCjReBEZHGh5O1A7SkgXLSA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2A66F8055C; Thu, 11 Jan 2024 08:28:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1271DF8057E;
	Thu, 11 Jan 2024 08:28:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75637F80254; Thu, 11 Jan 2024 08:28:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF2AFF80086
	for <alsa-devel@alsa-project.org>; Thu, 11 Jan 2024 08:28:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF2AFF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eA5xikvv
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1d3e05abcaeso33556635ad.1
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Jan 2024 23:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704958091; x=1705562891;
 darn=alsa-project.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q7o2fp3va6PrIWcX8vUj5HYMxS4ZIp+2h3KD5TCjvz8=;
        b=eA5xikvvvsRcQ4z1Li5EQqSt8nWdGk3mfOdgAv2E2AFFmQX8my/E4stcdSc6BYeJPf
         OVq3hSy9WHV6zijAszlRs3r2kZRqqxddAbZd4mHLNRaDRepu03RTELpBEuB86aQQiP1s
         nswm7UBBt6Cd51hHApsiMMQ0bGN57w/ArcKnBdwhSkTFPWouRMZ89QxCSmrPqw92Pw+7
         jd0Y8CplB9NHI6x8MtI+SrV10iWjj3OV++32L1zlyyN0k1KtbSdZbKDbAo6bPxewfCKM
         rZnzZNvLux9bpzXCRwF46TFrK5mYniXsFRZHIlzKk/KzhxuexOSTSQmmiLytjqh8c3KQ
         DKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704958091; x=1705562891;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7o2fp3va6PrIWcX8vUj5HYMxS4ZIp+2h3KD5TCjvz8=;
        b=n+CVBkHMPtgrxjNlQoGonf1wMeAk+u1Zs0Ac5tVNOwwOni7keFV9kCV0UgARQ8BIQy
         yjidju1i/yZf/ypYJ0t7nS7IEyIl87jSxALDv1/+4xrR1vWJ+BxbFrGG0uNNP6mibO+c
         f37Mh/MlcnKT7UdUrbpn3VQdELW/Uls+g0a9Ajfa6O+rCN1fO2EfP9ntxcX6QsR5ZfZx
         NNEY9Y6++3k8C/HFGNzFWnZ11b36EMGIOBrc0hnqSx9D1+ihE52/sxxtzyrw1u5y3D2z
         tJEIerS+EKKrj2ALoGQU4Y9/oflgsYlzClRlLqn0ITTREAMgSywJg0uyrZFrG1+MdfnV
         GM7A==
X-Gm-Message-State: AOJu0YxXeoNXFsOazAgawrjbtt3vhnm5k02DdgFuocNzHQGnUDQXnMxb
	/Osbzgk0UaOSskxLZjHQceY=
X-Google-Smtp-Source: 
 AGHT+IGl35uLlQRJwX4rvJzLGZrtgZstO0G3rpfy7BBTIi9UZR4sWdYeEO5QUbzFqaZyYXxS2sm4Lw==
X-Received: by 2002:a17:903:28f:b0:1d4:2066:6b7 with SMTP id
 j15-20020a170903028f00b001d4206606b7mr986820plr.69.1704958090495;
        Wed, 10 Jan 2024 23:28:10 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:70e2:a0a5:5166:fbbf])
        by smtp.gmail.com with ESMTPSA id
 mm3-20020a1709030a0300b001d4bb7cdc11sm491328plb.88.2024.01.10.23.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 23:28:10 -0800 (PST)
Date: Wed, 10 Jan 2024 23:28:06 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: James Ogletree <James.Ogletree@cirrus.com>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <Fred.Treven@cirrus.com>,
	Ben Bright <Ben.Bright@cirrus.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	James Schulman <James.Schulman@cirrus.com>,
	David Rhodes <David.Rhodes@cirrus.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peng Fan <peng.fan@nxp.com>, Jeff LaBundy <jeff@labundy.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Shuming Fan <shumingf@realtek.com>,
	Shenghao Ding <13916275206@139.com>,
	Ryan Lee <ryans.lee@analog.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"open list:CIRRUS LOGIC HAPTIC DRIVERS" <patches@opensource.cirrus.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK,
 TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
	"moderated list:CIRRUS LOGIC AUDIO CODEC DRIVERS"
 <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v5 4/5] Input: cs40l50 - Add support for the CS40L50
 haptic driver
Message-ID: <ZZ-YhtIulqrSFc3R@google.com>
References: <20240104223643.876292-1-jogletre@opensource.cirrus.com>
 <20240104223643.876292-5-jogletre@opensource.cirrus.com>
 <ZZoFUwOEF6NByIp2@google.com>
 <564A2601-4933-4BD7-B4E6-C973A585CA61@cirrus.com>
 <ZZ3JNuLp-ZfGOQRF@google.com>
 <42A07166-6569-4872-B5E0-6D71C6F3656D@cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42A07166-6569-4872-B5E0-6D71C6F3656D@cirrus.com>
Message-ID-Hash: JHB2YREJMHOFLZ2PCW6XVX3ZZR6LFCNL
X-Message-ID-Hash: JHB2YREJMHOFLZ2PCW6XVX3ZZR6LFCNL
X-MailFrom: dmitry.torokhov@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHB2YREJMHOFLZ2PCW6XVX3ZZR6LFCNL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 10, 2024 at 02:36:55PM +0000, James Ogletree wrote:
> 
> > On Jan 9, 2024, at 4:31 PM, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > 
> > On Tue, Jan 09, 2024 at 10:03:02PM +0000, James Ogletree wrote:
> >> Hi Dmitry,
> >> 
> >> Thank you for your excellent review. Just a few questions.
> >> 
> >>> On Jan 6, 2024, at 7:58 PM, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >>> 
> >>> On Thu, Jan 04, 2024 at 10:36:37PM +0000, James Ogletree wrote:
> >>>> +
> >>>> + info->add_effect.u.periodic.custom_data = kcalloc(len, sizeof(s16), GFP_KERNEL);
> >>>> + if (!info->add_effect.u.periodic.custom_data)
> >>>> + return -ENOMEM;
> >>>> +
> >>>> + if (copy_from_user(info->add_effect.u.periodic.custom_data,
> >>>> +   effect->u.periodic.custom_data, sizeof(s16) * len)) {
> >>>> + info->add_error = -EFAULT;
> >>>> + goto out_free;
> >>>> + }
> >>>> +
> >>>> + queue_work(info->vibe_wq, &info->add_work);
> >>>> + flush_work(&info->add_work);
> >>> 
> >>> I do not understand the need of scheduling a work here. You are
> >>> obviously in a sleeping context (otherwise you would not be able to
> >>> execute flush_work()) so you should be able to upload the effect right
> >>> here.
> >> 
> >> Scheduling work here is to ensure its ordering with “playback" worker
> >> items, which themselves are called in atomic context and so need
> >> deferred work. I think this explains why we need a workqueue as well,
> >> but please correct me.
> >> 
> >>> 
> >>>> +
> >>>> +static int vibra_playback(struct input_dev *dev, int effect_id, int val)
> >>>> +{
> >>>> + struct vibra_info *info = input_get_drvdata(dev);
> >>>> +
> >>>> + if (val > 0) {
> >>> 
> >>> value is supposed to signal how many times an effect should be repeated.
> >>> It looks like you are not handling this at all.
> >> 
> >> For playbacks, we mandate that the input_event value field is set to either 1
> > 
> > I am sorry, who is "we"?
> 
> Just a royal “I”. Apologies, no claim to authority intended here. :)
> 
> > 
> >> or 0 to command either a start playback or stop playback respectively.
> >> Values other than that should be rejected, so in the next version I will fix this
> >> to explicitly check for 1 or 0.
> > 
> > No, please implement the API properly.
> 
> Ack.
> 
> > 
> >> 
> >>> 
> >>>> + info->start_effect = &dev->ff->effects[effect_id];
> >>>> + queue_work(info->vibe_wq, &info->vibe_start_work);
> >>> 
> >>> The API allows playback of several effects at once, the way you have it
> >>> done here if multiple requests come at same time only one will be
> >>> handled.
> >> 
> >> I think I may need some clarification on this point. Why would concurrent
> >> start/stop playback commands get dropped? It seems they would all be
> >> added to the workqueue and executed eventually.
> > 
> > You only have one instance of vibe_start_work, as well as only one
> > "slot" to hold the effect you want to start. So if you issue 2 request
> > back to back to play effect 1 and 2 you are likely to end with
> > info->start_effect == 2 and that is what vibe_start_work handler will
> > observe, effectively dropping request to play effect 1 on the floor.
> 
> Understood, ack.
> 
> > 
> >> 
> >>> 
> >>>> + } else {
> >>>> + queue_work(info->vibe_wq, &info->vibe_stop_work);
> >>> 
> >>> Which effect are you stopping? All of them? You need to stop a
> >>> particular one.
> >> 
> >> Our implementation of “stop” stops all effects in flight which is intended.
> >> That is probably unusual so I will add a comment here in the next
> >> version.
> > 
> > Again, please implement the driver properly, not define your own
> > carveouts for the expected behavior.
> 
> Ack, and a clarification question: the device is not actually able to
> play multiple effects at once. In that case, does stopping a specific
> effect entail just cancelling an effect in the queue?

In this case I believe the device should declare maximum number of
effects as 1. Userspace is supposed to determine maximum number of
simultaneously playable effects by issuing EVIOCGEFFECTS ioctl on the
corresponding event device.

Thanks.

-- 
Dmitry
