Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B463E295B9C
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 11:20:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 467AD17A9;
	Thu, 22 Oct 2020 11:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 467AD17A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603358434;
	bh=TRI3R2Eqryu4wPkFiaicQ9OWCh+Yyo0J6gaxBhpSWnE=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fkTvN833KgD2u04dh+b8IYlR1josPy+J3AgmbhGt/QW2vSRcr/X1Ic3W1xeblBEyG
	 lNeQ9gdFl9FY4LCKYknLpoX4VyB8EEmFZANWfmyxeSD8ohMU6Dq70uIqltc/b0S6aH
	 8zGzC+bz6PTUg/xNeWHmmE+y8p1pO9kpybKW4AJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6F2BF8049C;
	Thu, 22 Oct 2020 11:19:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F3FAF804A9; Thu, 22 Oct 2020 10:17:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36712F800CE
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 10:17:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36712F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernelim-com.20150623.gappssmtp.com
 header.i=@kernelim-com.20150623.gappssmtp.com header.b="le3ppPI7"
Received: by mail-ej1-x632.google.com with SMTP id k3so965487ejj.10
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 01:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernelim-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=igFMdXrmlm7DH4IiFTsflxJUEBAXk6Kgf8L4rtIcqE0=;
 b=le3ppPI7cb4FDz/doF7bhmlskZE4TrGCjYkr732wnnDecCx6lBLmVTYHkckoUAAjN1
 bNf0N1s3YL1OWNQGahF0ngNuAr/GqG6KQXDjB2sGbmRU+HfwEnaWdQDpl3kut/BQG4EL
 uAzSoICfeMwF6y8O9McKDqj5C/cEXf35ik6s2RrwxQ5V+6HYSZ5nqM7ZSA5OjzSfQ2w2
 xSw46GEfq1iYyyyYZyxXR9fpnxxfN5AsxQkQINSw6khtwYkOOkMYOmR6C1W1kw7eSid9
 X1X5wUE+LtZ0XUKAJO4C99Sx/0t9SR2xluNbqB2ynWL4eO02w5jmSHldTYeD5WPSFUbw
 vL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=igFMdXrmlm7DH4IiFTsflxJUEBAXk6Kgf8L4rtIcqE0=;
 b=Th2uxgO43oTOwXYOCvrrbG0M7iQNgHg8JjLaMAZCYzbS7WiUOqLAPgt0FsRjSq+p1e
 etO4+TIbf86vLmq3pmATvMPr7//wzGkdeEFFX/n6kJj3USEjdxzE9a/nKGshbzABCn7n
 p6J/mKldmXHYoa5hJKr/N/vGnwuhKnFFvBLErsb/fqG+Qj0cYvfF6jLxlLTjJ1WqN4uC
 WvzbqrR7U+r4dufKEQMgxxn+iTmaJAwvGsEoMBkapGd0wy/Jylnnp/CDuKRa7k+Ht/XL
 z6sauR+a+ZfLfJI6LOLtKyAdmw9s/UcoR4bHUu1FhKMIj2T5VP4vOI+k02yDCh8DXS0Z
 abDw==
X-Gm-Message-State: AOAM531ZYy8lS8jyrzFJd9IHY59izDqCeenydqYNNfSWm2Ylf3LCTKGT
 S8CMEK+8odQDuGLfXx7IaWeJqlhNhsrHubEy
X-Google-Smtp-Source: ABdhPJzNKM0+49eStgzFCwT3addtw2KQMNWIaNmwT2orvYRYd6x0m+4iDMbmfVoIVzzoAaL+eqBUeQ==
X-Received: by 2002:a17:906:4351:: with SMTP id
 z17mr1166314ejm.110.1603354669263; 
 Thu, 22 Oct 2020 01:17:49 -0700 (PDT)
Received: from gmail.com ([77.124.42.64])
 by smtp.gmail.com with ESMTPSA id m6sm428755ejl.94.2020.10.22.01.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 01:17:48 -0700 (PDT)
Date: Thu, 22 Oct 2020 11:17:46 +0300
From: Dan Aloni <dan@kernelim.com>
To: alsa-devel@alsa-project.org
Subject: on-board sound on ASUS TRX-40
Message-ID: <20201022081746.GA1118484@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 22 Oct 2020 11:18:55 +0200
Cc: Takashi Iwai <tiwai@suse.de>
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

Hi,

The on-board earphone jack does not seem to work on an ASUS TRX-40
board. Here's the alsa-info.sh output:

http://alsa-project.org/db/?f=7a94c1b1eec4b2e623c75770364ec43c33d6c95c

Tried coding up the patch below, but it _does not_ fix the problem. It
does shows the earphone as 'plugged' though. Verified that it's not an
hardware issue via Windows.

Please instruct on how to debug this further.

Thanks!

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 9af7aa93f6fa..ab0f036f385e 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -568,6 +568,10 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
                .map = trx40_mobo_map,
                .connector_map = trx40_mobo_connector_map,
        },
+       {       /* ASUS TRX40-PRO */
+               .id = USB_ID(0x0b05, 0x1918),
+               .map = trx40_mobo_map,
+       },
        {       /* Asrock TRX40 Creator */
                .id = USB_ID(0x26ce, 0x0a01),
                .map = trx40_mobo_map,


-- 
Dan Aloni
