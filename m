Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0362886B23
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Mar 2024 12:14:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1218F2232;
	Fri, 22 Mar 2024 12:14:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1218F2232
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711106082;
	bh=f0W8AmMEciWNbUomSsj85sksb9OZXzv31VNnP8JfV1s=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=H1zDvFrrkUpoz8oN7Z1sHpn+xS23rXU91OBC+hNr/SxZTSHgtzL2iVY2iPzPySFFw
	 g4vO3uP2Rb4ccU+mSSUERwrsMo3jgV0LGRwAxSMJ3NrsAe5iwhb+wP8mLHkXbMaHQ8
	 PsfnoJkw9WYOdWS0G7EpgPmn6nmfsf1/zqRJMMPg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68BC4F805AC; Fri, 22 Mar 2024 12:14:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFD3DF805A1;
	Fri, 22 Mar 2024 12:14:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E473F804E7; Fri, 22 Mar 2024 12:13:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F1E9F80088
	for <alsa-devel@alsa-project.org>; Fri, 22 Mar 2024 12:13:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F1E9F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=wt/hbZnp
Date: Fri, 22 Mar 2024 22:13:22 +1100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1711106029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=1/ResQf63Os8uK8iRxlu80wHgKVbHi8GqvCXTfvvtpY=;
	b=wt/hbZnpKSSdQ1m2+0t28S35UvbJlWxVm1c74zIaXiYcj0xG/iVbzmubHM1GGTUnJeBs9U
	Lzk/0FV6Z7acbPm0RGDPL924CsGThqHKsUt7LfoUpy7+iiZn5Tnj1qYvZ8vpwNuuvxW0vN
	P2CCEV8PsANTUG3hWTFnkIKlfB+bnkWI6+tPXK1oqzz0PM2SYlnWbVYTAAen/VTb7iY9jV
	49Kw7t3cu7E9DmZvEYWFu2INfoVMmv0/j4at5IzSOJevQVrK00duX8gBooYsLdgbl6LHUQ
	10HyKFH01R07+n1RYWo8f+MI4o6aq8j7jDW6KqHBfdgNqaujMVGIC9sb+R7sAw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: alsa-devel@alsa-project.org
Subject: Variable mclk-fs in ASoC audio cards?
Message-ID: <Zf1n0tYNNMBUfbqt@titan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: LEFMSJS3J45H65CIDGZCFKC4UDUHO3O2
X-Message-ID-Hash: LEFMSJS3J45H65CIDGZCFKC4UDUHO3O2
X-MailFrom: contact@jookia.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LEFMSJS3J45H65CIDGZCFKC4UDUHO3O2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Greetings fellow ALSAers :)

Over the past month I have been working on a driver for the 8-channel TDM
CS5368 audio codec. However I've run in to an interesting snag that seems to
be an open problem. Let me explain.

The audio codec generally runs at 8 channels of 32-bit data, so:
MCLK = BCLK = LRCK * 256

However it is possible to read 4 or 2 channels instead:
MCLK = BCLK = LRCK * 128
MCLK = BCLK = LRCK * 64

This trade-off allows avoiding high frequency clocking at the expense of a
reduced channel count.

>From what I current see the way to indicate the multiplier here is using
mclk-fs in the device tree, but this would mean effectively fixing the channel
count in the device tree.

I have searched around found someone has suggested mapping mclk-fs to rates here:
https://lore.kernel.org/all/CAEnQRZDpJu27_pB=-ZYQjsNPC8eA4-Ur-36niT2hCosMWtC7jw@mail.gmail.com/T/#u

This functionality is somewhat adjacent to it, but I was wondering if it would
be better to somehow factor dai-tdm-slot-* in to mclk-fs calculation.

Perhaps mclk-fs could be divided by dai-tdm-slot-num then multiplied by slots?

Has anyone hit this problem before? How did you solve it?

John.
