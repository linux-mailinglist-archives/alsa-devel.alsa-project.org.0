Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yB0kBVChnmlPWgQAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Feb 2026 08:14:24 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8034F19320F
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Feb 2026 08:14:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 496CE601C5;
	Wed, 25 Feb 2026 08:14:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 496CE601C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772003660;
	bh=+9WMDl9fD2uvebFPt2zVyBjzdAdc1r1WoUhmANtyeyY=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=R2nyReubbqSw7yc2hz6JMjMvSr0wPhS/nQ4XbUggJiH7DPAGv/Ea8tnmUkWgtUmcA
	 DQsnHygciJVDlDWqp443ewFmPUrrlBaLLloi2CJnIrrGIbHdIX5JF7yBA3yJIHHhhl
	 1SukY5U4vSLsiLO8yYG7L0b4+HY6k3HmyPGW8Mc0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CE64F805E7; Wed, 25 Feb 2026 08:13:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0987AF805B6;
	Wed, 25 Feb 2026 08:13:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08B91F80537; Wed, 25 Feb 2026 08:10:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_FAIL,SPF_HELO_NONE,
	URIBL_BLOCKED,URIBL_ZEN_BLOCKED_OPENDNS shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from disco.pogo.org.uk (disco.pogo.org.uk [93.93.128.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A009F80071
	for <alsa-devel@alsa-project.org>; Wed, 25 Feb 2026 08:10:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A009F80071
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=xwax.org header.i=@xwax.org header.a=rsa-sha256
 header.s=swing header.b=n/hQaBPb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xwax.org;
	s=swing; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Cc:
	Reply-To:In-Reply-To:References:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=kxWxeNFmynfljz0tV8/xx/MonJ5jCJVrwZfFAUefo9c=; b=n/hQa
	BPbsQoEgkjtnM49CGOB8IFmIMqAwVcyy4/n2o4Q+fesMbmHES9qcty5EzhDkFSAtXEO6LNdW8tqMx
	fdySrSf9L6dh6oC9ftXJJ25eucEyjtHqCRC4WqDbktTsR6LEcUdxeOkD1BSuRe0Stux0UyM/2J3gE
	7HpZu0mN3aUE=;
Received: from cpc93786-hari17-2-0-cust786.20-2.cable.virginm.net
 ([82.36.99.19] helo=stax)
	by disco.pogo.org.uk with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2 (FreeBSD))
	(envelope-from <mark@xwax.org>)
	id 1vv92V-000000007eA-43zb
	for alsa-devel@alsa-project.org;
	Wed, 25 Feb 2026 07:10:32 +0000
Received: from localhost (stax.localdomain [local])
	by stax.localdomain (OpenSMTPD) with ESMTPA id b88a632c
	for <alsa-devel@alsa-project.org>;
	Wed, 25 Feb 2026 07:10:31 +0000 (UTC)
Date: Wed, 25 Feb 2026 07:10:31 +0000 (GMT)
From: Mark Hills <mark@xwax.org>
To: alsa-devel@alsa-project.org
Subject: Why does MMAP access ignore start_threshold?
Message-ID: <dbcc61b6-a5be-b2c3-381c-63d5a8a9a843@xwax.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID-Hash: XA6PMFFDODXVY7JVT5NCZK67PGWQFD5Q
X-Message-ID-Hash: XA6PMFFDODXVY7JVT5NCZK67PGWQFD5Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XA6PMFFDODXVY7JVT5NCZK67PGWQFD5Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[xwax.org,none];
	R_SPF_ALLOW(-0.20)[+mx];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,xwax.org:s=swing];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,xwax.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xwax.org:mid,xwax.org:dkim];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mark@xwax.org,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8034F19320F
X-Rspamd-Action: no action

It seems that start_threshold (swparams) is not honoured if MMAP access is 
used.

Whereas I expect that once a total of enough bytes have been committed the 
device automatically starts the consuming of the buffer, as it does with 
snd_pcm_writei().

Is this a bug, or intentional design?

It does not seem to be the subject of any documentation -- yet for many 
years I seem to be be working around it.

Perhaps I am consistently doing something wrong, here's a test case below.

-- 
Mark


#include <alsa/asoundlib.h>

#define always(r) _always(r, __LINE__)
#define FORMAT SND_PCM_FORMAT_S16
#define ACCESS SND_PCM_ACCESS_MMAP_INTERLEAVED

static void _always(int r, unsigned line)
{
	if (r < 0) {
		fprintf(stderr, "%d: %s\n", line, snd_strerror(r));
		abort();
	}
}

static void set_hw(snd_pcm_t *pcm,
		unsigned rate,
		unsigned channels,
		snd_pcm_uframes_t buffer_size,
		snd_pcm_uframes_t period_size)
{
	int r;
	snd_pcm_hw_params_t *hw;

	snd_pcm_hw_params_alloca(&hw);

	r = snd_pcm_hw_params_any(pcm, hw);
	always(r);

	r = snd_pcm_hw_params_set_access(pcm, hw, ACCESS);
	always(r);

	r = snd_pcm_hw_params_set_format(pcm, hw, FORMAT);
	always(r);

	r = snd_pcm_hw_params_set_rate(pcm, hw, rate, 0);
	always(r);

	r = snd_pcm_hw_params_set_channels(pcm, hw, channels);
	always(r);

	r = snd_pcm_hw_params_set_buffer_size(pcm, hw, buffer_size);
	always(r);

	r = snd_pcm_hw_params_set_period_size(pcm, hw, period_size, 0);
	always(r);

	r = snd_pcm_hw_params(pcm, hw);
	always(r);
}

static void set_sw(snd_pcm_t *pcm,
		snd_pcm_uframes_t start_threshold,
		snd_pcm_uframes_t avail_min)
{
	int r;
	snd_pcm_sw_params_t *sw;

	snd_pcm_sw_params_alloca(&sw);

	r = snd_pcm_sw_params_current(pcm, sw);
	always(r);

	r = snd_pcm_sw_params_set_start_threshold(pcm, sw, start_threshold);
	always(r);

	r = snd_pcm_sw_params_set_avail_min(pcm, sw, avail_min);
	always(r);

	r = snd_pcm_sw_params(pcm, sw);
	always(r);
}

snd_pcm_uframes_t do_mmap(snd_pcm_t *pcm)
{
	int r;
	snd_pcm_uframes_t frames, offset;
	const snd_pcm_channel_area_t *area;

	r = snd_pcm_wait(pcm, 1000);
	always(r);

	r = snd_pcm_mmap_begin(pcm, &area, &offset, &frames);
	always(r);

	r = snd_pcm_mmap_commit(pcm, offset, frames);
	always(r);

	return frames;
}

snd_pcm_uframes_t do_write(snd_pcm_t *pcm, unsigned channels, snd_pcm_uframes_t frames)
{
	int r;
	void *buf;
	size_t len = channels * snd_pcm_format_size(FORMAT, frames);

	buf = alloca(len);
	bzero(buf, len);

	r = snd_pcm_writei(pcm, buf, frames);
	always(r);

	return frames;
}

int main(int argc, char *argv[])
{
	int r;
	snd_pcm_t *pcm;

	r = snd_pcm_open(&pcm, argv[1], SND_PCM_STREAM_PLAYBACK, 0);
	always(r);

	set_hw(pcm, 48000, 2, 2048, 512);
	set_sw(pcm, 1024, 512);

	r = snd_pcm_prepare(pcm);
	always(r);

	for (;;) {
		snd_pcm_uframes_t frames;

		if (ACCESS == SND_PCM_ACCESS_MMAP_INTERLEAVED)
			frames = do_mmap(pcm);
		else
			frames = do_write(pcm, 2, 512);

		fprintf(stderr, "written %lu\n", frames);
	}

	r = snd_pcm_close(pcm);
	always(r);

	return 0;
}
