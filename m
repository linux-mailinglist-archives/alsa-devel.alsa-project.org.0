Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 130781C2809
	for <lists+alsa-devel@lfdr.de>; Sat,  2 May 2020 21:33:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A635E169E;
	Sat,  2 May 2020 21:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A635E169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588448017;
	bh=QqZrRTrap5IcPh1MYBsTNqOnaWZdd0eQc3lZvC6nMls=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VhVJxIdgcT5ymBwDYHBxxIRirMiAMS8P8OE9wYSnKkgXhGK7h9/vgmcrNbhgqHQ1P
	 iJfnUCpJb/J7QIs9vYZDCO/RNILvWiajmI2s8+M1Y0nW+T6q1btJfxXv9cFCN9yodV
	 xu5Qki9Kaz/6QIcVPAPcCEuB1pihjyf5PTMrZ2Zw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2D2BF800C5;
	Sat,  2 May 2020 21:31:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 406FDF8024A; Sat,  2 May 2020 21:31:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1028FF800C5
 for <alsa-devel@alsa-project.org>; Sat,  2 May 2020 21:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1028FF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AMJcy3JR"
Received: by mail-pj1-x102f.google.com with SMTP id a32so1712281pje.5
 for <alsa-devel@alsa-project.org>; Sat, 02 May 2020 12:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8wvT5J/+zQU/yp3V4lBTm3O+Ggu6RBwVxWEg4ET38uo=;
 b=AMJcy3JRRlcpKW+Nke02DnXLT1Da/OxBx2A2FV6OGIyBlAHuiPXtW1syQooRst/Nz4
 7Cm0aD3DkQkkkiojz+eiXZkeW2vNEHFkcdToxCrLjxORkin1B2gBR/WmPgE9urQb2KNP
 VCSnykMjNPO3+KcwEQ76Ap725jVhJuzBh/sP2qjrh99bRiDAvrJBrEIN8Pux8IInyza3
 +ojZcHYMLF1g7y6jgivnWPiRCpgnMrpP6pXeouQZ6+XT61vzerhP21UR+MMX3MJmcjg3
 ZmpvIWsrCQ7JPZzNMuDYgMIH7DKC7UG/USybs5rFCFPIhVK3cb+KFNcwXveBWQuG8Pdq
 BRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8wvT5J/+zQU/yp3V4lBTm3O+Ggu6RBwVxWEg4ET38uo=;
 b=huA7+Zim+qCNoNbzHiMHC5hEgVaX5hd16EHNAwDjJA5lng6NSp8isCet1kEMJrlFaW
 wj5QiTk9A4xkRhXQkPKTeAvI2pUrG9+FxQ2BgOVBnVV4oB1ciQ1MhlkoTnjphkPo1gcD
 TinrBer77P/qC5NtI7aJcOyV92MtBAD0IWzoyC888Q//HeXEV3BecaBIZnPeTKvxoVaj
 S7KfQ1kmVrnGzv+WyIfX0QdoSjt5s7Yw5/haQ+PthNGjT4MLs5gKg+AMIRFQBf7SQO6m
 DfjXsdeFGINMj2XjVVN2cOehqkSWQQA4sb4vKyakgeVuwcY5tCZx+YcRcZ+HCV4LW0o2
 DoFg==
X-Gm-Message-State: AGi0PubkoIYdzl+TRqC+KIbt8Dy6yCpCKru7/C1I6DBAsGUFATI4AwJ/
 2N1sJAtnukXHtuOJ4I3qcXw=
X-Google-Smtp-Source: APiQypKenahJwklXT+P+kKvZoiQs6hLV191e2+BtChueiWITQoX4qTFW7t2uAZKRN2TO3YYttW96bg==
X-Received: by 2002:a17:90a:e2c1:: with SMTP id
 fr1mr7459366pjb.124.1588447905115; 
 Sat, 02 May 2020 12:31:45 -0700 (PDT)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net.
 [216.71.213.236])
 by smtp.gmail.com with ESMTPSA id 138sm5034358pfz.31.2020.05.02.12.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 12:31:44 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Pavel Machek <pavel@denx.de>,
 Allison Randal <allison@lohutok.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ALSA: line6: hwdep: add support for poll and non-blocking
 read
Date: Sat,  2 May 2020 12:31:18 -0700
Message-Id: <20200502193120.79115-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
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

This series adds support for polling and non-blocking read for hwdep
interface. This allows apps to listen to HW events without using busy
loop.

Example of app that uses hwdep interface for POD HD500 can be found
here: https://github.com/anarsoul/line6_hwdep_test

Vasily Khoruzhick (2):
  ALSA: line6: hwdep: add support for O_NONBLOCK opening mode
  ALSA: line6: Add poll callback for hwdep

 sound/usb/line6/driver.c | 20 ++++++++++++++++++++
 sound/usb/line6/driver.h |  1 +
 2 files changed, 21 insertions(+)

-- 
2.26.2

