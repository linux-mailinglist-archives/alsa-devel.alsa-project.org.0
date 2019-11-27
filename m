Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5E910B1B2
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 15:56:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B26416F9;
	Wed, 27 Nov 2019 15:55:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B26416F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574866609;
	bh=1Yq9JGn/Ps1rtyVNJKnHFH8ggFXMsaHH8Pz7tWgkRow=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iqE3owMyx7vthmL+5XHgxwaAZg4N7HVsvTOt2g3EfsWgUXC6v39P9D/OR3+NeWqjB
	 DwWOtYrIWpM+hMCSlnlFdMfmP6PZkAc97DIh9XK7iFmwd8ElbAc8sxp4oIfDUqcq7/
	 lxLPML9Uv4D2zujOaJfU5YOCtyhRD8wTEBcpQTis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D3E6F8020C;
	Wed, 27 Nov 2019 15:54:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 384CEF8014D; Wed, 27 Nov 2019 12:10:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF970F800E9
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 12:10:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF970F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=spalge.com header.i=@spalge.com
 header.b="KkoedAEv"
Received: by mail-pl1-x62d.google.com with SMTP id bb5so9610712plb.4
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 03:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spalge.com; s=google;
 h=to:from:subject:date:message-id;
 bh=CsACaBnn+gCc6FjiGWIi5TGnrWvMVpe9XbJjG+10hV8=;
 b=KkoedAEvEaIFWAN13LtzFl8UgCcAxWE+TU9FA4pnePRF3dOONxUIt1lPu9c40kjFa+
 Gi4W9NybUOlbJ/jRf1HmX1yu8Dk9vRfEzyLMnjRijcsuTqHRHFURo55CWJCIUP7Q+dLi
 mOg2sqlVOq2x+UeQAg2ctKqYNsxUNYAb7h1YJaSdsW23M8m8oi/j0erYnk56GI3/aJn6
 I/HoE9sRjNVi+EcZMpx68o576nYOGy3O7g4VX8/t367ZiHQvS8V/iRZAUZAqvElupM2m
 nvYCbCzR2A6JolDdpgVnNs+33/5BrapNZf759nrTmby4BZv+1DAg79CTNHmejDubdJdi
 egYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:date:message-id;
 bh=CsACaBnn+gCc6FjiGWIi5TGnrWvMVpe9XbJjG+10hV8=;
 b=sSJ+nLh2fMAdnag9fyJi/YVsVMTc+CTrz1P+9mO4A7GArw5dJI17IPaHVm452Z0Bzf
 CC3oh7BbQejIDuZafhCoeTJoBTG45u0kV54QKRN6+PI7jJkDS2xCYlOqpY/ytBPuyUHQ
 u7zji2f5zHmg2TC+FzeqKPpKc9ULxw2igMOb4TA1L60iVxhly4nNb9QT9HM+uwI0Dwc7
 w23iCHBrshLK6IQ1ceOrNOTpx91mOczUm+ssOLDkmBd8uLt8/HcwzImTcs4lNfXsdtuW
 eYgyrE1mfMKm4KEvGSMNSfxeHBQY16X8x9V+eY0RiTPXrDviUo3doF7SEY5Dlc3c6zp0
 AWJg==
X-Gm-Message-State: APjAAAV2NGcUtdNzLnCsopllJ8nD/kYFYc647nC7sRmGE7JuR5C1EIPX
 6DVTRoirE782nfSAhT+EzoswlLu9NQU=
X-Google-Smtp-Source: APXvYqyMOYpphIfqu80+kEo52yDN6YWotI7vaAo7YZ47JT49kvNqn+TC+b0MArHAOYDMRW1+V4yfFA==
X-Received: by 2002:a17:90a:98d:: with SMTP id 13mr5250355pjo.98.1574853022658; 
 Wed, 27 Nov 2019 03:10:22 -0800 (PST)
Received: from spalge.com (122-62-54-156-fibre.sparkbb.co.nz. [122.62.54.156])
 by smtp.gmail.com with ESMTPSA id
 l9sm2887422pgh.34.2019.11.27.03.10.20
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 27 Nov 2019 03:10:21 -0800 (PST)
Received: from localhost ([127.0.0.1] helo=spalge.com)
 by spalge.com with esmtp (Exim 4.89)
 (envelope-from <paul.clark@spalge.com>) id 1iZvDk-00010v-5y
 for alsa-devel@alsa-project.org; Thu, 28 Nov 2019 00:10:56 +1300
To: alsa-devel@alsa-project.org
From: jimmy@spalge.com
Date: Thu, 28 Nov 2019 00:11:00 +1300
Message-ID: <157485306051.7240.17832027873995946223@jimmys.spalge.com>
X-Mailman-Approved-At: Wed, 27 Nov 2019 15:54:17 +0100
Subject: [alsa-devel] Multiple LADSPA plugin paths when some of them error
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Having multiple lookup paths for ladspa plugins is supported by separating
them with ":" in a "path" directive on the pcm definition in asoundrc or the
LADSPA_PATH environment variable. But if there is an error encountered while
looking for the plugin in one of the earlier paths than later ones won't be
checked.

My use case is that I have a mixed architecture system (moving from 32 to 64
bit) and I need applications of both architectures to do sound stuff. Since
the dlopen will always fail for one of them it doesn't quite work as-is (I've
patched it locally sufficient for my needs).

I think snd_pcm_ladspa_look_for_plugin in src/pcm/pcm_ladspa.c should be
changed to not return on errors in the loop but just log a message and
proceed.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
