Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0887F938F8A
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 15:00:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91616B60;
	Mon, 22 Jul 2024 15:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91616B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721653248;
	bh=m2SEt3T2kjY4+Ov8IvCoLE+6CrWGgIA8XpgFh7Ia6F8=;
	h=Date:To:From:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AjSNHyuxxbTBYhqS+ylgSe/Cn33ZciV1nHHu9zLLlZq7yLJ7v4yIbC78eCh1WZK3e
	 cuMhtUvE98CDy1V1qn+076PkB+ExfBQxNNwvxUbYppdjqr2J6gNOOsKWxs64Kibdsr
	 5m38rYl5nE6PlOr8ArXp284mL6nJYtku4r/ayQoQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A025AF801F5; Mon, 22 Jul 2024 14:59:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66B53F80615;
	Mon, 22 Jul 2024 14:59:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5464FF8026D; Thu, 18 Jul 2024 14:30:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch
 [185.70.43.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1901AF8007E
	for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2024 14:29:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1901AF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256
 header.s=protonmail header.b=V1w4xwbr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1721305792; x=1721564992;
	bh=m2SEt3T2kjY4+Ov8IvCoLE+6CrWGgIA8XpgFh7Ia6F8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=V1w4xwbrMQF+JCXkyERuIUisNW9QTc4Unf7CXh0/e85N2QHUU4Us0I8LSfDGBc2NI
	 SjbRq14bYsFRluZjAfv/Tsd6YXDTavqdfw6ab0qbVlYqeC3N4zNIddOV8yL3rPGKBE
	 GBb+T1ivmsH71PFGNV6Hqwti28hIGWRt5tIXZjVZZk3A5qB2KKylOOH0nHznTyd7J/
	 YWhHKpohOtzPGHAphYWAnAT0CYiLXiv3KHDacX/b6KeJ4QiUwKqvnTKAaBfvGalDeL
	 b88/xKqFJQxSfuEH7DFvPRIYwrEV/n8BjycbJpKczBGP99+VSkRaswFpSkY+pjAoVo
	 DuBboQteGgY7w==
Date: Thu, 18 Jul 2024 12:29:48 +0000
To: stable@vger.kernel.org, alsa-devel@alsa-project.org
From: "edmund.raile" <edmund.raile@proton.me>
Cc: regressions@lists.linux.dev, o-takashi@sakamocchi.jp, tiwai@suse.de,
 clemens@ladisch.de, linux-sound@vger.kernel.org
Subject: [REGRESSION] ALSA: firewire-lib: heavy digital distortion with
 Fireface 800
Message-ID: <n4jdkizinqfoztqn2cwv7uqqqnvkyu2xk32qebazqznh74b3d3@r23skt4k7mqe>
Feedback-ID: 45198251:user:proton
X-Pm-Message-ID: 813c186901566fe7b46392b8d79e9e54e51d48d8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: edmund.raile@proton.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2VKHHL26PKPBUIZJPH24QJBHNVPTR4DR
X-Message-ID-Hash: 2VKHHL26PKPBUIZJPH24QJBHNVPTR4DR
X-Mailman-Approved-At: Mon, 22 Jul 2024 12:59:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2VKHHL26PKPBUIZJPH24QJBHNVPTR4DR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Between the kernel releases 6.9.9 and 6.10.0, something changed that causes
heavy digital distortion on playback from at least ALSA and PipeWire.
The rhythm of the music is discernable in the output, so it isn't just
random noise.
It sounds a bit like bitcrushing, but not quite.
The generated overtones appear to be dependet on the sample rate.

I am sorry I can not be more specific, there are no kernel messages this ti=
me.

As Mr. Sakamoto recently committed all these changes to firewire he might
be able to identify the issue easily, which is why I'd like to ask him to
look into it.

Kind regards,
Edmund Raile.

#regzbot introduced: v6.9.9..v6.10

