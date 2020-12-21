Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB392DFED6
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Dec 2020 18:18:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3017C170A;
	Mon, 21 Dec 2020 18:17:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3017C170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608571082;
	bh=WR5YcAk4uPDmS+YmwqAS3BDVf+Za0Xc03FERC6Qe3I0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MDqB5zDSkjuMhgDHlTfCmli9dXAOPRA7GIMxnV+D+5Z799Ty4/vYeRuA1nBqUB/QT
	 0yHKmuluUosXdvgL0dRxYth39Pu2f3Cc+m0s3SErkubKZHdiamEJ2WwFIyIUX8e3kG
	 IZkoPiD87dR4DRXhcZ1VpKJIp3X4YUcFKSsKwclg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B34C5F800E4;
	Mon, 21 Dec 2020 18:16:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B17BF801D5; Mon, 21 Dec 2020 18:16:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EFDAF80116
 for <alsa-devel@alsa-project.org>; Mon, 21 Dec 2020 18:16:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EFDAF80116
Received: from mail-lf1-f72.google.com ([209.85.167.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1krOn5-00031o-Nx
 for alsa-devel@alsa-project.org; Mon, 21 Dec 2020 17:16:11 +0000
Received: by mail-lf1-f72.google.com with SMTP id i21so11344109lfe.14
 for <alsa-devel@alsa-project.org>; Mon, 21 Dec 2020 09:16:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Pz4SBTDx6BMkbLDQ5nrfRYm9x7WmPr6bGZI10+5Wso=;
 b=BiPbt8IfsDdHoLexxEILg/v8o5Axfw+7voJpnZCSBdMgy417X0tmKlYz0bdmUPhIp1
 ndnkSg6xrnwVuDG7gZg2NAwemgilTRSQ/OfGbnVy8GMi+X1mzJ9fbBpue4f4Ad+a+US5
 1cPwuCSGAhxQHQ3h3rcKhTk5mYXsCELK6kh2wocvK6dyWPpHtmPCSOS4KYrv/twaNZpg
 BzeGlkjzFQCzJ1NTPiWDevaRytg6o4uW6REJAXTWY7rvlTqpyUG7wKmR+as52SHe7PDO
 48dJPJf+NFjHdA+2QldoO5cWpUUby5XJ5wRkO5qSyo+we9xLl/bYrthVwcGcLJEpDwnH
 uPSQ==
X-Gm-Message-State: AOAM530bXZBmbmI+2tsI7eZJTkqcZGAhaBgA8qBDWFa/khvFLT3st4yS
 pYuOAER1M5ElDMobPq2R2cZpiImvMgs3GRJ6DDZoB56ZWsYzPUtRHho41eyR6u26pEwm1/snHAy
 lS/bq57Sjp07Py+8HcoJgdrYHhredRElbS+yWnG9RjTdB5/dYnVlF6ERB
X-Received: by 2002:a05:651c:118b:: with SMTP id
 w11mr1574954ljo.402.1608570971160; 
 Mon, 21 Dec 2020 09:16:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2YXycweLB9saylOYpQELQXyDWheqBfUKEeeBhg9fBTp5dxHBt0XV6PKI9T7tz8LDvPKU6uC6XcVCTDVBIws8=
X-Received: by 2002:a05:651c:118b:: with SMTP id
 w11mr1574936ljo.402.1608570970912; 
 Mon, 21 Dec 2020 09:16:10 -0800 (PST)
MIME-Version: 1.0
References: <20201214060621.1102931-1-kai.heng.feng@canonical.com>
 <20201216124726.2842197-1-kai.heng.feng@canonical.com>
 <s5h5z51oj12.wl-tiwai@suse.de>
 <CAAd53p6kORC1GsW5zt+=0=J5ki43iriO-OqtFvf5W67LWhyyhA@mail.gmail.com>
 <s5hzh2dn3oa.wl-tiwai@suse.de>
 <CAAd53p6Ef2zFX_t3y1c6O7BmHnxYGtGSfgzXAMQSom1ainWXzg@mail.gmail.com>
 <s5hsg85n2km.wl-tiwai@suse.de> <s5hmtydn0yg.wl-tiwai@suse.de>
 <CAAd53p6MMFh=HCNF9pyrJc9hVMZWFe7_8MvBcBHVWARqHU_TTA@mail.gmail.com>
 <s5h7dpfk06y.wl-tiwai@suse.de>
 <CAAd53p53w0H6tsb4JgQtFTkYinniicTYBs2uk7tc=heP2dM_Cw@mail.gmail.com>
 <s5hft3zf6mi.wl-tiwai@suse.de>
In-Reply-To: <s5hft3zf6mi.wl-tiwai@suse.de>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Tue, 22 Dec 2020 01:15:59 +0800
Message-ID: <CAAd53p7TOBwee6dfY8uY=2P6wGJ9Uf551LVp95jLwz7SA9PWFA@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda: Continue to probe when codec probe fails
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, nouveau@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 Bjorn Helgaas <bhelgaas@google.com>, Alan Stern <stern@rowland.harvard.edu>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Mike Rapoport <rppt@kernel.org>
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

On Tue, Dec 22, 2020 at 12:47 AM Takashi Iwai <tiwai@suse.de> wrote:
[snip]
> But what happens if you plug the HDMI cable later and want to use the
> HDMI audio?  It won't work with your fix, right?

No it won't.
It's possible to fix from nouveau, but it's at the mercy of Nvidia to
fix their proprietary driver, which many users use.

Kai-Heng

>
>
> Takashi
