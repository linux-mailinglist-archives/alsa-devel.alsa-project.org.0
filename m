Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 957F3196E21
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Mar 2020 17:15:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29AAE1674;
	Sun, 29 Mar 2020 17:14:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29AAE1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585494900;
	bh=2PjNgBtdsHyA5tAc+3TGEf5v4u04bV6LEQ92WIwUWtM=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Twh5Reid0QIsq12zJvBMIG3KW3LicTAX2LzC/Kh7aMmgHE9BxTh5gxqejbSLGL2QE
	 Sg7tPMDYVxqEoLJB2CjtktIfZjN6OvwqKfde3JxXsL52MXksiKrFyIygkKUt7lI7Ph
	 K0opsSAGcUyDR7hL6peuVR+Ee8NTYzyfkD/+ptQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3916FF8014F;
	Sun, 29 Mar 2020 17:13:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22CD1F80146; Sun, 29 Mar 2020 17:13:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E408F800EB
 for <alsa-devel@alsa-project.org>; Sun, 29 Mar 2020 17:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E408F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QxQtM5Ev"
Received: by mail-wr1-x432.google.com with SMTP id a25so17929753wrd.0
 for <alsa-devel@alsa-project.org>; Sun, 29 Mar 2020 08:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=Mgjs8xajMn9W9PUQ6drvOMbHCW1ew3eGJ1p/v+LPELs=;
 b=QxQtM5EvVBP4wc2UHJJGzBmrJMOuV5iIOALXqe9ZuS8Aj5EmTgCtl8WQv0dq60x2LE
 C187zDutH8IkzlI0zDOw8dr9FmAQ1emyZ148Yb7F76uSu0wHhwEM6sFd1mBHjalCFLHe
 CY/wtMPiGZwfXfb0WyKks1yYUY5Q/ohHcAfqAajtUYShaCJAy8NWIuxZcZwyH+OD3yEL
 jAwis4hqIC7tsbVrswk7v74zOfWdeTFptQcHJjQWDmOvee769PTZzEz1EhV5V8tLY/bl
 ugkL6eTAMQEuXStr/zIn8c3+NI2UZJazmpnQYlf9JUP4Tv1DSMCA9zOVepQoe7bCL2bm
 mlQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=Mgjs8xajMn9W9PUQ6drvOMbHCW1ew3eGJ1p/v+LPELs=;
 b=IMGRav2YnxmR36bmapNA9NVMzVC+U/xgKqjH6wBwA8tZxCPw+wwzGUXF7O4tHUpa7L
 uB7gTCANU99KmsANxQ1lnSa04A8drqzBGAsXjAD3EfIHMEo8CRZerzMOGY21O6JMpmOY
 vJXtJ6RPom/huIxln+wun7qsWnivRNtD7zkrf/QsdSqwOaLXR/j9AxZgETKKxesE4Qga
 +x0THrMVRPSuYmtYU/yANOWP3jcKdQ6mFUoWY6VpNBn9dT5t36Tk4enbgou7bBEv/HX9
 TmBuBdyAc+P8j6bgFiczODm019RJg6bYzszk4sroDt/Lx7hcJMhHUnAaSkudBhJYOO+A
 8FXg==
X-Gm-Message-State: ANhLgQ3FvX8ABMCqUd2ab5vivzJW8paFSVI8Ru3S5HgDFFRIgyhbrwRP
 amh8hhPtg9UTrc+9T8LpKDogkxwH
X-Google-Smtp-Source: ADFU+vu4gB2Jcf01eHXvOicZj2lio0he0q3SeZ2Twa05qZn3+I1R29cpc/0IoA6KQfgCFNjCgTflQg==
X-Received: by 2002:adf:9cca:: with SMTP id h10mr9943222wre.167.1585494788449; 
 Sun, 29 Mar 2020 08:13:08 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id m19sm17199751wml.48.2020.03.29.08.13.07
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 08:13:08 -0700 (PDT)
Date: Sun, 29 Mar 2020 15:12:41 +0000
From: sylvain.bertrand@gmail.com
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] fix some output pcms being namehint-ed as input pcms
Message-ID: <20200329151241.GA395@freedom>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/ (2018-04-13)
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

This is additional cleanup following:

commit d434638a683c01bd6decf8f41863044055237a50
    namehint: remember the direction from the upper levels

signed-off-by: Sylvain BERTRAND <sylvain.bertrand@legeek.net>
---
based on arecord -L output 
--- a/share/alsa/pcm/front.conf
+++ b/share/alsa/pcm/front.conf
@@ -53,6 +53,7 @@
 			name defaults.namehint.basic
 		}
 		description "Front speakers"
-		device $DEV
+		device_output $DEV
+		omit_noargs true
 	}
 }

--- a/share/alsa/pcm/iec958.conf
+++ b/share/alsa/pcm/iec958.conf
@@ -78,6 +78,6 @@
 			name defaults.namehint.basic
 		}
 		description "IEC958 (S/PDIF) Digital Audio Output"
-		device $DEV
+		device_output $DEV
 	}
 }
