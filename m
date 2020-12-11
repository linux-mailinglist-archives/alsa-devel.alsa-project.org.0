Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A782F2D70B6
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 08:16:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DA6715E2;
	Fri, 11 Dec 2020 08:15:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DA6715E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607670981;
	bh=UG/AzY5s2ecfv69Y+eRh+JIwqe+W0NA7/7LLdiQc62c=;
	h=Date:From:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ilDNWS/Qx8/eNUElu1n2mR+3F+LkgsTnTHt1h3mdRNkI20pQ7p1FxUArfHpF21/L6
	 iwFcY22z0NRh7UDuo/sASlMQzdKPuX1rnAaOzINcdgj/0RJuCzn4LhRYTnhz1roHLv
	 +4iVdibe2UTtVH+X+vVd6gWLJ6AGLAk2l4TWFy5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67E40F80217;
	Fri, 11 Dec 2020 08:14:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16660F8020D; Fri, 11 Dec 2020 08:14:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=AC_FROM_MANY_DOTS, HTML_MESSAGE,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8073DF8014E
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 08:14:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8073DF8014E
Received: from mail-pl1-f199.google.com ([209.85.214.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kncdQ-00053s-4L
 for alsa-devel@alsa-project.org; Fri, 11 Dec 2020 07:14:36 +0000
Received: by mail-pl1-f199.google.com with SMTP id x17so4904695pll.8
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 23:14:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:message-id:mime-version;
 bh=iBHI7+3aTwdl2EcYneEuYceNW8CRxfacexArOYQEiSw=;
 b=RnSvNtn4BZEPwEYIhEybaA8Be8nH3zMaISg6eWg6MZp0p5cZRulxd/wNbzTyU8dnPs
 k3Z5s8sZYWmA0KNG0vmz5nc5ZeZMBaIjzAy2RR0hJsXHo5Hn/6eVF7Tv0CvQpOSWTyW+
 jFSEcYSwhPtrcW+PUpJ6DSBBWHSKuQmmd2fQyRaSkD39Nnf5eneBxZ0HgMuIrGPFcdaQ
 QR3BE/xRXdtEzIjwNghMF4WoBLD5vCNae9wqes7VhCq4IAnGIx+vG3WdJXnHQGJXY7dn
 4pDCdJiCmLpGMSwnb5aVcZSSL75wZLx0J4FDsRGH7IpywOE8Qt9ndUPN6FA6u6/CMpUR
 WYuw==
X-Gm-Message-State: AOAM530tQMbaQ9MjxZYHNPwW5kAFPNK9y08vVH8BqqPR7TrXpj4mOEBK
 UoJeXqo5uQn+obVqlRSrEz2UQpe3MgSwwydoG3fqpBa4A/dLTl7hKi6uZ2/n1WwTtW0V9EEgWY1
 VCJ+of1xnAz1cxvXgU9DuXI7KhIFfMYw+YKke/nYM
X-Received: by 2002:a17:902:22e:b029:d9:e591:7bd1 with SMTP id
 43-20020a170902022eb02900d9e5917bd1mr9998632plc.50.1607670874306; 
 Thu, 10 Dec 2020 23:14:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJfwu3qdjTDvMHmoTYkc0fo3N6x/qu9OJJZ12FpqNZ4HL2sTVSpHunJzyB4Sv/DrXAjC432w==
X-Received: by 2002:a17:902:22e:b029:d9:e591:7bd1 with SMTP id
 43-20020a170902022eb02900d9e5917bd1mr9998604plc.50.1607670873696; 
 Thu, 10 Dec 2020 23:14:33 -0800 (PST)
Received: from 2001-b011-3815-5b5e-d66c-5a1f-1bf7-6aef.dynamic-ip6.hinet.net
 (2001-b011-3815-5b5e-d66c-5a1f-1bf7-6aef.dynamic-ip6.hinet.net.
 [2001:b011:3815:5b5e:d66c:5a1f:1bf7:6aef])
 by smtp.gmail.com with ESMTPSA id cu4sm9358690pjb.18.2020.12.10.23.14.32
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 23:14:32 -0800 (PST)
Date: Fri, 11 Dec 2020 15:14:24 +0800
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: How to annotate USB jacks without jack detection?
To: SOUND <alsa-devel@alsa-project.org>
Message-Id: <0SY5LQ.NPOPM8PL9XNK1@canonical.com>
X-Mailer: geary/3.38.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hi,

There are some UAC1 devices come with jacks, but without jack detection 
ability. And many USB/Thunderbolt docks are equipped with such USB 
device.

Userspace like PulseAudio automatically switch to USB audio when they 
gets plugged. However, auto-switching to UAC1 device can be problematic 
because it may not connected to any headset or speaker.

So I wonder what's the best way to let userspace know the USB device is 
a jack without jack detection ability? Through sysfs or dedicated UCM 
conf?

Kai-Heng

