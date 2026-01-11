Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7C4D0FE2F
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Jan 2026 22:04:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE4F660200;
	Sun, 11 Jan 2026 22:04:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE4F660200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1768165457;
	bh=DSY1mTqUEZ7JQV2JLvjTiepAnK8fTY97HZ8es7cSW9s=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XIu5vx/UiKN8HrO45feR6yMrU/oTglHVtS8UAxgP76Vtl1ciKLvnXqBTJIYiLLqqm
	 3UCkRgR7s2hEA4smBFK/VH0nLy0x3v/6ps5eBds9hLXiOd8MJyvrK+q7o+lUUUocZ5
	 mzmaadng3WZSUqs5I3Y2swsN3Nw5195CCKXDzvHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5171AF805E7; Sun, 11 Jan 2026 22:03:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75F6DF805D4;
	Sun, 11 Jan 2026 22:03:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8634F80149; Sun, 11 Jan 2026 22:01:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from disco.pogo.org.uk (disco.pogo.org.uk [93.93.128.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6967AF800E4
	for <alsa-devel@alsa-project.org>; Sun, 11 Jan 2026 22:00:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6967AF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=xwax.org header.i=@xwax.org header.a=rsa-sha256
 header.s=swing header.b=VKUTjW5W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xwax.org;
	s=swing; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Cc:
	Reply-To:In-Reply-To:References:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=nqQGUDuqQOoYhXJ6W+fcwDKJ0+0hEC6XAXNynTqxRBM=; b=VKUTj
	W5WYFyUQcT2QJEDGNNQgoFs5vzlJ5HWX3vEwDfuYgOui7MYyyaUnSwNfo0RHzcGmiLdJLuBBlZF7N
	AWLNOSrq5a7tLwPSWU9K4N96vJOfE0IXVXh9Ow7FAJPPAM4Y4gJ4G557mYUZx7A8VGGHn7YcoW7J3
	SNby/nD2F3d0=;
Received: from [2a00:23c7:36ed:c201::fd4] (helo=tamla)
	by disco.pogo.org.uk with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2 (FreeBSD))
	(envelope-from <mark@xwax.org>)
	id 1vf2YR-00000000DL4-0Exa
	for alsa-devel@alsa-project.org;
	Sun, 11 Jan 2026 21:00:55 +0000
Received: from localhost (tamla.pogo.org.uk [local])
	by tamla.pogo.org.uk (OpenSMTPD) with ESMTPA id 4e310caa
	for <alsa-devel@alsa-project.org>;
	Sun, 11 Jan 2026 21:00:50 +0000 (GMT)
Date: Sun, 11 Jan 2026 21:00:50 +0000 (GMT)
From: Mark Hills <mark@xwax.org>
To: alsa-devel@alsa-project.org
Subject: Can't resample into ALSA plugin
Message-ID: <b7b70838-2452-8481-e9ae-f9001ddaf74e@xwax.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID-Hash: 5SROZKCD2QVZNHPJZWIDYSC26AVJUWID
X-Message-ID-Hash: 5SROZKCD2QVZNHPJZWIDYSC26AVJUWID
X-MailFrom: mark@xwax.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5SROZKCD2QVZNHPJZWIDYSC26AVJUWID/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I've written an ALSA plugin (ioplug) of the form below.

My plugin offers only S16, 48000Hz.

I expected a "plug" device would take the application's request and 
resample to 48000Hz, but instead it fails:

  $ aplay -D plug:mytest cd-audio.wav
  Playing WAVE 'cd-audio.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo
  aplay: set_params:1456: Unable to install hw params:
  ACCESS:  RW_INTERLEAVED
  FORMAT:  S16_LE
  SUBFORMAT:  STD
  SAMPLE_BITS: 16
  FRAME_BITS: 32
  CHANNELS: 2
  RATE: 44100
  PERIOD_TIME: 125000
  PERIOD_SIZE: (5512 5513)
  PERIOD_BYTES: (22048 22052)
  PERIODS: (3 5)
  BUFFER_TIME: 500000
  BUFFER_SIZE: 22050
  BUFFER_BYTES: 88200
  TICK_TIME: 0

It doesn't call .hw_params, so the negotiation has failed based on 
snd_pcm_ioplug_set_param_*.

Without the plug:

  $ aplay -D mytest cd-audio.wav
  Playing WAVE 'cd-audio.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo
  Warning: rate is not accurate (requested = 44100Hz, got = 48000Hz)
           please, try the plug plugin (-Dplug:mytest)
  hw_params: format=S16_LE channels=2 rate=48000 period_size=6000 buffer_size=2400

Modify the plugin 48000Hz to be 44100Hz and negotiation passes, so it 
suggests the rate is the problem (not some other parameter like period 
size)

I tried a variety of things including directing aplay to use specific 
period and buffer size.

Thanks

---

/*
 * Code extracts, error checks removed for brevity
 */

static snd_pcm_ioplug_callback_t callback = {
	.close = _close,
	.hw_params = hw_params,  /* prints them */
	.start = start,
	.stop = stop,
	.pointer = pointer,
	.transfer = transfer,
	.delay = delay,
	.pause = _pause,
	.resume = resume,
	.prepare = prepare,
};

static snd_pcm_ioplug_t initialise = {
	.version = SND_PCM_IOPLUG_VERSION,
	.name = "My test",
	.callback = &callback,
};

SND_PCM_PLUGIN_DEFINE_FUNC(mytest)
{
	struct state *s;
	snd_pcm_ioplug_t *io;
	unsigned access = SND_PCM_ACCESS_RW_INTERLEAVED;
	unsigned format = SND_PCM_FORMAT_S16;
	unsigned rate = 48000;

	s = malloc(sizeof(*s));
	...

	s->io = initialise;
	s->io.private_data = s;
	io = &s->io;

	snd_pcm_ioplug_create(io, name, stream, mode);
	snd_pcm_ioplug_set_param_list(io, SND_PCM_IOPLUG_HW_ACCESS, 1, &access);
	snd_pcm_ioplug_set_param_list(io, SND_PCM_IOPLUG_HW_FORMAT, 1, &format);
	snd_pcm_ioplug_set_param_list(io, SND_PCM_IOPLUG_HW_RATE, 1, &rate);

	*pcmp = io->pcm;
	return 0;
}

-- 
Mark
