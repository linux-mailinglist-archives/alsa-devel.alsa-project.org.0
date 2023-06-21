Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E0A738A60
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 18:04:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A07B114E;
	Wed, 21 Jun 2023 18:03:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A07B114E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687363469;
	bh=PYMTdbVF2PMr4ZhHNAxwUqn6dETM9Y5e8rTc5YEuElE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pvP5766NWJ+SxUlu9fYfrlyZq9ECN6flotZDsM3agrIpzAWqSNBb/hzPmgQz8MRZ8
	 RlebUbqn02ZqAxOzOOzjn34KsRuNNu95Drzg6jEyLeu0YU0/OCOGp2YxcizGc6i2B4
	 Qa6QQDZpXYcgOMvRmFAEz+oexatsWmeK/mgfDm14=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAAE2F80535; Wed, 21 Jun 2023 18:03:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EEF0F80132;
	Wed, 21 Jun 2023 18:03:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C7BBF80141; Wed, 21 Jun 2023 18:03:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FDFAF80124
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 18:03:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FDFAF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=ZH47d6tx
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6FD016602B7B;
	Wed, 21 Jun 2023 17:03:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1687363408;
	bh=PYMTdbVF2PMr4ZhHNAxwUqn6dETM9Y5e8rTc5YEuElE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZH47d6tx1IAY9eICX09S/l0nMoX7geEWUVBWBlDjMVBWGrYo3F9BeP0EQseXgLsdS
	 qI73pj1x+d6ohBsGebvhDWx6b0UlCIq5lvU3viVJi0WnXZkS+aXvavaWSZRlBUfzP3
	 z8LuuP4nfH2IeTNzucIfxq8KLFCo9Tf9TpGqVvFWLHzugNvhI6b/+n0xdncg1NETV4
	 J7X3rqOAMbAb6ZVQ8yHRFj+BHL9ADIEtSXKLVO7eAb7Tp2+gK2cM89D1SVHKYnNqSf
	 q2EJUEGNf5KwgABniY9lkrieQ7bQ2n3RhY/Pb1hYl1WkqzFL90tNqxcE6qtd2Gj4j8
	 qUWkEed7QRPHA==
Date: Wed, 21 Jun 2023 12:03:22 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shuah Khan <shuah@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] kselftest/alsa: pcm-test: Decrease stream duration
 from 4 to 2 seconds
Message-ID: <5c2d5213-5299-44f1-9611-26002c8a5d3a@notapiano>
References: <20230620220839.2215057-1-nfraprado@collabora.com>
 <20230620220839.2215057-3-nfraprado@collabora.com>
 <33bea0d3-b8dd-4936-812e-392166df4437@sirena.org.uk>
 <443f697b-fecf-6e8e-0b76-65257aff7da8@perex.cz>
 <9069ad0c-d166-4620-a3de-a36ab233cab0@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9069ad0c-d166-4620-a3de-a36ab233cab0@sirena.org.uk>
Message-ID-Hash: TWRHKZJO5PR37YJ6MA2FM2AV5OQMQYOT
X-Message-ID-Hash: TWRHKZJO5PR37YJ6MA2FM2AV5OQMQYOT
X-MailFrom: nfraprado@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TWRHKZJO5PR37YJ6MA2FM2AV5OQMQYOT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 21, 2023 at 03:39:12PM +0100, Mark Brown wrote:
> On Wed, Jun 21, 2023 at 04:08:47PM +0200, Jaroslav Kysela wrote:
> 
> > I think that the problem is somewhere else here. The overall test timeout
> > should be calculated dynamically. All tests may be queried for the maximal
> > expected interval based on the hardware/software capabilities. It's a bit
> > pitfall to have a fixed time limit where the realtime tests depend on the
> > number of devices.
> 
> I tend to agree here, unfortunately Shuah hasn't responded to queries
> from Nícolas about this which I imagine is what inspired this patch.  We
> also have problems with mixer-test on one of the Dialog CODECs with a
> couple of 64k value controls and no cache only mode.

Yes, exactly. I've tried increasing the timeout for this test to a larger fixed
value previously, and later asked for more information on how to deal with the
kselftest timeout. [1]

Since I didn't hear back, I thought this patch would be a way to at least
mitigate the issue for now, without limiting the test coverage, which was a
concern with having limited scopes for the test.

I've just noticed that in the mean time a way to override the timeout when
running kselftest has been introduced [2], so I suppose we could use that to
work around the timeout limitation in CI systems and be able to run through
completion on the different hardware at the lab. But I still believe, like you
do, that calculating the timeout at runtime based on the hardware would make
much more sense, though if there's such a desire to keep kselftests under the
45s mark, I'm not sure if it would be acceptable.

[1] https://lore.kernel.org/all/5302e70d-cb58-4e70-b44f-ff81b138a2e1@notapiano/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f6a01213e3f8

Thanks,
Nícolas
