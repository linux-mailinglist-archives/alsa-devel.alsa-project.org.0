Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BCE2E0A2A
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Dec 2020 13:49:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 212B816DD;
	Tue, 22 Dec 2020 13:48:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 212B816DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608641335;
	bh=rejmTl4GT4jyDaLO84RbaZ4HoD9qdSL0vAd8Q2frHNg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YknnyxofLTbbgOrddbTKtdAPy8JsbZNT7j7nro6zpE4Ff8s2Eu5AC9dDncq9UCgtb
	 1eGcPe/PIT61XzSKNqsi+eA/oI0W8vjTi2yniTYY1vfKJYyzo9XmX+XYGoqVgcRmVr
	 uNiNX2GlUqHmIF0D3AWSU0enTzwsUd/vcxP5dkwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BD80F80161;
	Tue, 22 Dec 2020 13:47:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A3B2F80224; Tue, 22 Dec 2020 13:47:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24955F80116
 for <alsa-devel@alsa-project.org>; Tue, 22 Dec 2020 13:47:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24955F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=superlative.org header.i=@superlative.org
 header.b="RQ3ug1iY"
Received: by mail-wm1-x332.google.com with SMTP id q75so2073129wme.2
 for <alsa-devel@alsa-project.org>; Tue, 22 Dec 2020 04:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=superlative.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=y1twnAUMJ0MibGSyTAultCcQyZg76LL2NBzbvkzdN+A=;
 b=RQ3ug1iYZyxaCNl6rJ9LdXtM7ZH2g8YxN7f+HGn5I+mWC1ymrjazvgPGFMCBPCtZ8/
 zZNbLUcv8z4bPBqCZPk9WCeaGVriMlastjUZSyGwm1W7gLKxXhLUh9noV1BCTnRBIRuh
 xOZ3A7SJuPpWd8utP9ES4fcN4wRvIwmkeTrpGdIYvDSFa3rpFHgfOxUPVzjgm0D6F5Z+
 vJwmm3K8aNj97x8QEA8nQflMQ44ZyfzSwrRIUDyDDSmHPMSV16jsse1a8CZCfcBiKOzy
 is7xb7jqi2QPQk1ZhrcYNWvCDOhdgIu3AnZ3tJVVeueLiDA00wxZ2kvwNGOEumJwN9oH
 mWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y1twnAUMJ0MibGSyTAultCcQyZg76LL2NBzbvkzdN+A=;
 b=oBlVRfkhvuujz3ICVdxJJ7Oeh0oHDfJDjkbhjpYUNzCQ/Bgoog6AdlvTxZQFRLfvBZ
 t17T6K/kMX79CAefbiUrFWNG3ldGi5cRJFL5rQhQoNUEwl2IaMJai2cLi8EdFP+pznl6
 1olUgZHmMYEJ4EjMLWDwYRJuMNZQfi7QgPLMoC9+bxEJjqX1XtJJ53+IV6PVT9fIyAqt
 BVA4M9UC9H+24pANS/pLRYxabO+qv3/5H0e3sv7YwtKlV3ijfbO37/vpyVUEyE/epK9V
 ImVhosgv5QuMfs+QwNUOruKbn4/Sl4yfnaAva6keLJLQPc67Z00Z1vIzgN6XaJE8/ynW
 XGeA==
X-Gm-Message-State: AOAM5333P43aXCG8IMfUlEMeqnOZ7YOc/Fx91SPvUpc7QRmBQbyNXG8r
 splDXjhp4FiR1UPo9Q+WhX8pKd8RbYtzTg==
X-Google-Smtp-Source: ABdhPJzv5iH6dThzxBW63x3+FEFyRinK6U1qKBh2EexsJvRfN4oYkynWrFSib41iNcL+yCKSTSb3kg==
X-Received: by 2002:a1c:7c19:: with SMTP id x25mr21978593wmc.94.1608641233585; 
 Tue, 22 Dec 2020 04:47:13 -0800 (PST)
Received: from kam-desktop.localnet
 (2.1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.f.a.9.2.a.0.e.b.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:be0a:29af::12])
 by smtp.gmail.com with ESMTPSA id o124sm24272143wmb.5.2020.12.22.04.47.12
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 04:47:12 -0800 (PST)
From: "Keith A. Milner" <maillist@superlative.org>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: usb-audio: Add implicit feeback support for the
 BOSS GT-1
Date: Tue, 22 Dec 2020 12:47:12 +0000
Message-ID: <5928529.DvuYhMxLoT@kam-desktop>
In-Reply-To: <s5ha6u6fdpa.wl-tiwai@suse.de>
References: <20201221215533.2511-1-oliphant@nostatic.org>
 <s5ha6u6fdpa.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Tuesday, 22 December 2020 08:27:13 GMT Takashi Iwai wrote:
> On Mon, 21 Dec 2020 22:55:33 +0100,
> 
> Mike Oliphant wrote:
> > The BOSS GT-1 (USB ID 0582:01d6) requires implicit feedback
> > like other similar BOSS devices. This patch adds this support.

It seems I forgot to include the GT-1 IDs in the list I gave Takashi-san. 
Sorry about that.

Cheers,

Keith



