Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF4C48EE9C
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 17:44:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D0791FB4;
	Fri, 14 Jan 2022 17:43:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D0791FB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642178682;
	bh=E/8x0gIxqAp0QcrywRx6gCenHu1+sN10A5iUGDY81kE=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lAWD6fNJmOEuuW9MvXlfbcBBgfjxnlsXxjDqFery+SUmDTn37Ewmm6wHN7K55uwlo
	 wjojFsofJbFUjx/FX7KH3Siw7DEO3CYsrS6kiNUAxSIrS8A6AiZqOBDUqe+8kdbQ8Q
	 hfVSw0myi/l7nIgyrRyiNE5s57Cvt3lKSc06TwE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C543F800CE;
	Fri, 14 Jan 2022 17:43:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EFA6F8030F; Fri, 14 Jan 2022 17:43:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19193F80054
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 17:43:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19193F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a3CJyZ/j"
Received: by mail-lf1-x130.google.com with SMTP id s30so32064272lfo.7
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 08:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:mime-version
 :content-disposition;
 bh=u50us0AD3nwGYBzCMwJX7WF8TLsdut+YHsrfo8CJPWQ=;
 b=a3CJyZ/jLU+cLlc4mE7a17qTVo6dS8r1yJT4nLU2EjLDne0kM8tuyzg8e9wWe8Y1rZ
 3AXxcWkjz0JMQQcUCCR6PJbQDnZAeBNIWcKqImx3Pa5L56hGimc/3ORnnApaoP894PdK
 4rXCMZQJHWmJmNJkolRra+cze7ZgjxSnGA4gjjLJa5m8XCSFDCFE86xBWE8AWmespNMk
 yJyXCtmfidb3+QLyY1CnUdJ3TSngGut+5JFcvtOEeIIE2WFYOVlUAoA6ALWgnZScIXqL
 lsHTm2r9wNTqPUXDkb//zbLZf8sWShuNhg/HxM4Tp7utxuJilgkPmAImhNDMpv635j5G
 PL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :mime-version:content-disposition;
 bh=u50us0AD3nwGYBzCMwJX7WF8TLsdut+YHsrfo8CJPWQ=;
 b=YIokPrK0etcqvC9MNLfOn5dkj6rmJqFC9fVRVeUYmnGrtl7Hb02qorfb9Z8v4gvWyL
 zvbXhdRM6Cdt958TcpayujqKqe1SNHFRgM3Wm+SwhfJbQiHSEkIoCrVdE7DpicOWFozY
 HLLDt0XMoN0d5DXHHhJgP7BDYTnZfhvYhTtwJfx1Ef/Os61xiaepMokStuITCf/taiSw
 kn3WAhtz8x/pVkZcNh6FXLvy92K++kJxayAUibWhm+lh4fGwQHo43a1l0hGDiqGkrWtM
 ACS/MNS+0+zXZV17lm50hpOSemxmgmITS+DqUbnqnTiTSTaYZTzvGfaPMV29RJ63qZM9
 sofg==
X-Gm-Message-State: AOAM5303guVHz2kDHDVgsVM+wVSXkQoAo3Z9e+81hZI362DOoc7ohNY9
 uL1a8WacqLnlzZ1/V+5iOWc=
X-Google-Smtp-Source: ABdhPJy8oRBd9adSSDaJ1p5ffaklWXFU0PbvMzO4ZwJ2by8ZODfckkMB6FgQBA1GYupkLKeHr6Vacg==
X-Received: by 2002:a2e:b4b8:: with SMTP id q24mr2950046ljm.482.1642178604185; 
 Fri, 14 Jan 2022 08:43:24 -0800 (PST)
Received: from localhost.localdomain (ntd06459.static.corbina.ru.
 [95.31.14.149])
 by smtp.gmail.com with ESMTPSA id cf42sm627703lfb.251.2022.01.14.08.43.23
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Fri, 14 Jan 2022 08:43:23 -0800 (PST)
Date: Fri, 14 Jan 2022 19:49:05 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jeremy Szu <jeremy.szu@canonical.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Hui Wang <hui.wang@canonical.com>, Cameron Berkenpas <cam@neo-zeon.de>,
 Kailang Yang <kailang@realtek.com>, Sami Loone <sami@loone.fi>,
 Elia Devito <eliadevito@gmail.com>
Subject: [PATCH v2 0/1] ALSA: hda/realtek: fix speakers and micmute on HP 855
Message-ID: <20220114164904.lgj7yimbei6fmloe@localhost.localdomain>
User-Agent: mtt
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Rebased and re-tested on the latest sound.git tree.

Alexander Sergeyev (1):
  ALSA: hda/realtek: fix speakers and micmute on HP 855 G8

 sound/pci/hda/patch_realtek.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.34.1

