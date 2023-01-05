Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF77865E5C5
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 08:00:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C8ACF9AC;
	Thu,  5 Jan 2023 08:00:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C8ACF9AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672902057;
	bh=Ku5vW3I5cfiZBm5WV54VQ8hYvAnZ2rwk3j1+UqizMU4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YbXIwhc1uAaEZ3AbxUgzqyoo/geh2YxcBXmMCmaKVcC+1SIclMiw1n3jy91MAjdCe
	 fc5TknLxvj/682+ooxxk9qetnueOFB0syotCVpYWXh/iO/4I1lgmJNJKEZ9jTthSv3
	 GZtflY9OsCAYTKYK5T0h4IByU+eIGPSel1tRRhT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1994F804AD;
	Thu,  5 Jan 2023 07:59:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC021F804AD; Thu,  5 Jan 2023 07:59:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4436F8047B
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 07:59:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4436F8047B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=pasqua-li.20210112.gappssmtp.com
 header.i=@pasqua-li.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=NOgdjUEc
Received: by mail-pj1-x1029.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso1176857pjt.0
 for <alsa-devel@alsa-project.org>; Wed, 04 Jan 2023 22:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pasqua-li.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WAYNlLAlGIChjF/7BdEo98yWRQOW1ME0/bb1hqn8Rr8=;
 b=NOgdjUEcgzbSQWLSxNuKIj7w0dCi0dg/NpMXdpkIjcnvaNUu5VTjIZDoov9poD2yZ3
 s69EWgTbjY4oxhSclY17YxMEwRyQQJPTkkfkgBXYGIzHGLWGhn+B2vKIPjcAk9bG91UI
 647LPK9R4ulFeIDhuUpIPs1H8OiUDQVUnVI+pcV/L+X/J+DrOmJmRj1dKaL9T0UHr5QS
 ZjL0qd+cW6Gcu068FeAsjF0BCcF8BphVuPcZqF+FLuYox/TdzonSHZhJEJFcpQZ21F2M
 3241y2mKpbmI8/wnVVDTue1v/nTCbofQCUjHYUz124bdRLenKurua/byLm/SxuzXtK6W
 A00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WAYNlLAlGIChjF/7BdEo98yWRQOW1ME0/bb1hqn8Rr8=;
 b=hYcJyG3UPMevFpaQooHdorczUiKxjaxyw5mj8rIuIFf5Og1YEW9w1HFuZ7P2E9WjcS
 37kHA++6CD6i7sNHVHzeGOQw06e+8TGEeqykxLJd5Es5wf6v6CZ0TZ8wZhtU2fARj1dN
 IMxQvJT7jRwnxADl+NdyUQINw2ICnYZhzyyacUN1L9NAsLxbfUu8892Hzl9p8nrK0C1k
 ni6VXZ2kS3xxg2IGSQbmyka/4cW1mgROsNKZgd3nZWRutAiLzX1qOwSBp7h4B2WEwtoj
 SJJcLD2Yan7A3g4R+FH5lssLxYSeBoU0Ujobr+5ktmASdRgC2f4BgY+CW6f7cF03cHRa
 w9Jg==
X-Gm-Message-State: AFqh2krJsXn9ZM+ujPxY75hDWEcKIAWLATwd/jET8Uvue8fwKMONppmc
 9/xSY5VLJwwKsFP5KwCiMrrVcJp2Sy6urac99cJSZBMmXGFi79ST
X-Google-Smtp-Source: AMrXdXtcFq2dGo7B9/Zk6K0o3rwkJDTVpnx2RrRy8kPfMOuIu03OjokznUvOZYgvhd21wfF5QwwOP4HkJqNNHSOgsLY=
X-Received: by 2002:a17:902:d191:b0:192:a814:c8b7 with SMTP id
 m17-20020a170902d19100b00192a814c8b7mr1198235plb.92.1672901989367; Wed, 04
 Jan 2023 22:59:49 -0800 (PST)
MIME-Version: 1.0
References: <CAKcs0s0ht3wSY1VF05xwn6=MeVmnCQZkmOY8RLL6ATK8-NTy2A@mail.gmail.com>
In-Reply-To: <CAKcs0s0ht3wSY1VF05xwn6=MeVmnCQZkmOY8RLL6ATK8-NTy2A@mail.gmail.com>
From: Ricardo Biehl Pasquali <ricardo@pasqua.li>
Date: Thu, 5 Jan 2023 03:59:37 -0300
Message-ID: <CAKcs0s2PjU1Qcdr1dxBh0RTCEcReSk+E8FVnRs=2GW0hTS222g@mail.gmail.com>
Subject: A POSIX-compliant shell script for interacting with PCM devices
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

TL;DR: pcm.sh is a ~100 lines script that sets hardware parameters,
prepares the device, and forwards data to it, while being
POSIX-compliant, readable, and easily customizable.

The repository can be found at: <https://github.com/psqli/pcmsh.git>

Feel free to suggest changes.

Best regards!

        pasquali
