Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD4C34E638
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 13:14:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1273F167A;
	Tue, 30 Mar 2021 13:14:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1273F167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617102898;
	bh=Nq9aj0Sm8XcwDlBQSEPzcWHZYxJTtHH3TaAq9cGQGa4=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EEY+9xp9T4k35gxFvK1fFbiO8nPS7TNmUvls88A9ItmLWPxJmAws3XJ4BSyCcjnQB
	 C74Ho+ufKllMTKo2P93qKLiDjWnpGklHhMzUEFhg1InaMuIl97PbS2SdA7SpmS/PEm
	 2PN6H+odfxqf7HoGLYLGx7mAy/kj4gdV3/BhVP3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78750F80240;
	Tue, 30 Mar 2021 13:13:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B845F80240; Tue, 30 Mar 2021 13:13:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7521F80141
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 13:13:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7521F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="LnP03Zds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1617102806;
 x=1648638806; h=date:from:to:subject:message-id:mime-version;
 bh=up762C3lagCOpKox/BGyDdcJl27/AHOq+3D5ugaykww=;
 b=LnP03ZdsxiSz5OUi4Xgo07ucrqtGu4pJUJXJKkWApg1+iQsytsMzfsw3
 aGiAyBiMaY38+K/V0HkWvLRPZyvrje8dTP3ODKLbBcXKKoJXb7UC9acUq
 OZpttMFbTH2iMD7WtuipJyaQpdWTaXn9CFwaBWHnE8sp2bmU00W8C3BKh
 wbyeNu0MxjIx2gw4BnHmgPSWvNIJfW3TPJ3BU+kv+2gQvrtDjOI8pe+ta
 YK3wQSnApsPOFQ+JFb3S5DqjESynANaWyFO5XVJpO5CWf3ChXIvO5qEkf
 OTu3BvrNK247kwQDUSxG1lenv7FeHmbYmv8piK5rgqw2/XWN4eXRtx3ja Q==;
Date: Tue, 30 Mar 2021 13:13:16 +0200
From: Jonas Holmberg <jonashg@axis.com>
To: <alsa-devel@alsa-project.org>
Subject: No active event for loopback
Message-ID: <YGMHzBpftblFSr7X@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
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

I don't get an active-event when a loopback device becomes active if 
format, rate and channels has changed.

If I use aplay and alasctl monitor it looks like this:

aplay -D hw:0,0,0 -f S32_LE -r 48000 -c 1 -s 1 /dev/zero
=>
node hw:0, #0 (3,1,0,PCM Slave Active,0) VALUE
node hw:0, #0 (3,1,0,PCM Slave Active,0) VALUE

I.e. active value is true when playback starts and false when playback 
stops.

aplay -D hw:0,0,0 -f S16_LE -r 48000 -c 1 -s 1 /dev/zero
=>
node hw:0, #0 (3,1,0,PCM Slave Format,0) VALUE
node hw:0, #0 (3,1,0,PCM Slave Active,0) VALUE

I.e. format is changed to S16_LE when playback starts and active is 
false when playback stops. But no active-event was sent when playback 
started.

The same happens if rate and channels changes:

aplay -D hw:0,0,0 -f S16_LE -r 32000 -c 1 -s 1 /dev/zero
=>
node hw:0, #0 (3,1,0,PCM Slave Rate,0) VALUE
node hw:0, #0 (3,1,0,PCM Slave Active,0) VALUE

aplay -D hw:0,0,0 -f S16_LE -r 32000 -c 2 -s 1 /dev/zero
=>
node hw:0, #0 (3,1,0,PCM Slave Channels,0) VALUE
node hw:0, #0 (3,1,0,PCM Slave Active,0) VALUE

If all params are changed back at the same time only a format event is 
sent:

aplay -D hw:0,0,0 -f S32_LE -r 48000 -c 1 -s 1 /dev/zero
=>
node hw:0, #0 (3,1,0,PCM Slave Format,0) VALUE
node hw:0, #0 (3,1,0,PCM Slave Active,0) VALUE

Do format, rate and channels events always imply that the device 
becomes active or is it a bug that no active-event is sent when the 
device becomes active if a param has changed?

/Jonas
