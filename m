Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D979280069
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 15:47:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E36EC1783;
	Thu,  1 Oct 2020 15:46:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E36EC1783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601560022;
	bh=URaGAKppyeoOb9VrQcHsc4MknR/wWfZ103VRGlcsxgk=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a5nQ9Dnv0EEyR4xie1T1h5yjhwjEsW6PFQOIUjodoZGIs/F9vcugx3kRCKy/aJaed
	 3clnSq1InHfd7Lt/nrWd94UZyWQnuoETAcpwAdX3SWQXoTbHLAHz62yGhZkq9scwYk
	 H0zOFBLeu6QySL+9Gnk03F7UeGZyK/dzODC+XXX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C35EF8032A;
	Thu,  1 Oct 2020 15:40:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90F36F801ED; Wed, 30 Sep 2020 05:13:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A103F80110
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 05:12:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A103F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WAEnOzLE"
Received: by mail-ej1-x62d.google.com with SMTP id gr14so667999ejb.1
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 20:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Wv2Hyk9CbjTUmGuEb7oilrwcPeLJGhA77TylIUAK79U=;
 b=WAEnOzLEPsVr7O3g/e29VJPJDZe1D2msjP75JObUyH7GyrKWxEMFaW5DVBFxlVgqGi
 G0LWrSDJM4X7YCQ3evx/OAVGMVVMGgaQOWrvUMj5GuzHVLyHCYXTi52ngciEgz6fhUZh
 jM7Y/05uSAqtztBNKaUakBpMKUtSE6ocpXPpsqnpr4B6FYw/IUra8nPtOYTy+xfE/VxR
 6xJuXUdxBlaC6pL8sbZMrALnZGNYCPhT3ZiAA21Ny8wBu1yN60HDdMk5+GTHonvN19Aj
 SP9K+boH+LaSMVnuwup+4PKWEFfae4zeeSlS5KVX1LlUed33ZDr/4gUbWp52tdZPemt+
 uvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Wv2Hyk9CbjTUmGuEb7oilrwcPeLJGhA77TylIUAK79U=;
 b=CdxJwCjGoQ5tCFFIoZAGOS3mjOOLNI3YuLnhFWzAdAuXoRzE5+uQoKU7GzF1mhO6Xp
 +wCbI3x3qcwHKagpkR3wTNL9JXAsoV258hWol1lTjR5Tqy/2i5QQ7xRGs7BC7AcdRMME
 lIrzOk+a8BhJZBnVsT/MHht67zCpLMx5BaQoAZGmOsavt6EgPX9WxWL85GaxpOJSoA1z
 7kcFkNl0zcHxYzHKRhx2FPwvDjMPHtQV/lpmuE2YjYu3qGxcOEzUKRoc1Ilkc+oCIqaU
 Tm/Lf09WilxYGVDifWcxNJ9pxvB6b0Gc5xtiQ+6+ZEYwr8f8dgTV1zpb8XYK1RXyRuYO
 9tNQ==
X-Gm-Message-State: AOAM531yDQ17A6gRcOBEOH9DIonO3haZPeIslZrq2zweerxDhJn5OPJ3
 fLO7uWm6ATBtuSpCatz021c0oKvH3nBQNUR8VGfQVGeF
X-Google-Smtp-Source: ABdhPJxcBmXCGmnfAJkJiTHeGHkhQuiYsaNI4h3g81WHusUoILNu4wN8ngTu0H781QJTvBNUYNUmInX1D7WK5XfqQ5A=
X-Received: by 2002:a17:906:b756:: with SMTP id
 fx22mr689921ejb.245.1601435574992; 
 Tue, 29 Sep 2020 20:12:54 -0700 (PDT)
MIME-Version: 1.0
From: Phillip Andrews <phillipedison1891@gmail.com>
Date: Tue, 29 Sep 2020 23:12:43 -0400
Message-ID: <CAB0FhpaM9itLZ3=tKOGqt1i=cZE+eM_NgsF=YASRVjyArbuu4w@mail.gmail.com>
Subject: Problem with sequencer interface -possible bug?
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Thu, 01 Oct 2020 15:40:08 +0200
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hello, I've been writing an application working with ALSA's MIDI sequencer
middleware, and I've been trying to abort playback of a MIDI file by
calling snd_seq_reset_pool_output followed by snd_sync_output_queue. The
hardware device (a player piano in my case) is silenced, but
snd_sync_output_queue still blocks for roughly the amount of time it
*would* have taken for all the events to be played out - almost as if there
are "zombie" events that don't play, but are still pushed out according to
their timing.

I realize this is a thing with little to no use, and therefore little to no
developer attention, but I'm desperately trying to improve the
possibilities for hardware MIDI file playback on Linux. Is this something
someone would be remotely interested in exploring?

Thanks,
Phillip A.
