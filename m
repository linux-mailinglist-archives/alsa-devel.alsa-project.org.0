Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EAC2E71C7
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Dec 2020 16:24:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E4C7180E;
	Tue, 29 Dec 2020 16:23:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E4C7180E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609255454;
	bh=7DP9ndFdMXzKX7MPyIXhct4/rcWJvcZfVW6WfHHdetg=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ONDHuLqYh0ZWI3IKKZXDvY/NlFVbbQPYjQJvZ/05FasivijndU7a/8dY7HuFuGS+e
	 aIJWP3UJteg61eQAZ7FhfA+sviB6m/OT8F7hXs/WL3MZdOHgr+IRk7d4t2+dPYY/Kw
	 HkHs+s/ENCasyA6xIJ1yYvN5WOk02Y4R1VAXC2os=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0D8FF8020C;
	Tue, 29 Dec 2020 16:22:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4529BF8022B; Tue, 29 Dec 2020 16:22:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A9A7F80162
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 16:22:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A9A7F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bertschiettecatte-com.20150623.gappssmtp.com
 header.i=@bertschiettecatte-com.20150623.gappssmtp.com header.b="VOqeRLEu"
Received: by mail-yb1-xb35.google.com with SMTP id v67so12590011ybi.1
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 07:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bertschiettecatte-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=7DP9ndFdMXzKX7MPyIXhct4/rcWJvcZfVW6WfHHdetg=;
 b=VOqeRLEubY0Mh8BXKS63jQXlL2zY/xYWv1eU4aWTf9CwWh3sYccRqnKX67nLkgLyNM
 17JGdDBIZHQ0TFwDkKihmmVX95aZNsbBKVPEOC2vcx+Pbrh8FGCz3LXbIucv7kBGnZtn
 TsnAFpdSsLbloNTzPzthk12F8CQyOjtaLAg3eR+HARIJ9xqeaXbNSsLxUom4WHCpNowc
 YgF22hmih99Di75usigUU84ZaLTsjuT8gOVEO0IeOzSFdzcJUfZYCd0FmGqtczu3obQE
 aJMmaUWfYG1N9F9lGPP5r0dgfDHNJkW7R42QNo3sFEvPVWEVx2NIxjEhw11rb2guuKSR
 WEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7DP9ndFdMXzKX7MPyIXhct4/rcWJvcZfVW6WfHHdetg=;
 b=CK4aw3odCFK4CJcrjZ3bk16BNib7fbYng6aDrHCY0Mc7UGDw6Q3k1j9IUq+g3TztKY
 4+HYnQYi1p1j+PEKCCGkO4EIPAmqi+OGgcp13ih0XcdxpRNKQEuqfIKRXeKy8SSxr5Lw
 mVugIFHtq2DJvk0AD7rdwINS5cNY6AAJCunULvAcqesRtmX0ReLe6jJqFincA40tciN1
 8wsN4qiwQBVqaqCTT2HR+UTMFLE1PPtxI/OVzIgHL3D9UbDdw/Mso0JZxiKabdhZSzss
 u1mW4zTsGbU9dtyQj9VRsJMCtDT4iOsIZd6H5E8/KofEJ64KBI8PwqS0kQsrp9XkPZWo
 vmgA==
X-Gm-Message-State: AOAM530WjEb6yS69xIAsiFGWXGsJVqZbasoSqAX/fVewnnrE/cxi/Bjd
 x4X685Pa5OJxP+y+6P4ZSY+P4cXb/Qg5haH76b/iS/Ee8Mfw9A==
X-Google-Smtp-Source: ABdhPJyWEC9YkVMLuZRinUeNqpBFubt97X9cinWGMSeB6uUgls3g0B+OhL4/ZHE2aXYGBRZgYCjyx1rXxK72s1v7DUs=
X-Received: by 2002:a25:ccc9:: with SMTP id l192mr73666154ybf.85.1609255349580; 
 Tue, 29 Dec 2020 07:22:29 -0800 (PST)
MIME-Version: 1.0
From: Bert Schiettecatte <bert@bertschiettecatte.com>
Date: Tue, 29 Dec 2020 07:22:18 -0800
Message-ID: <CALd3UbR-1WHwpw=y-OMM6w6wTpKQ9mkY6J1F3KwLMQKrwWL_Lw@mail.gmail.com>
Subject: configuring usb 2.0 audio gadget correctly via configfs?
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
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

Hi all

I am using kernel 5.9 stable and I'm trying to configure the usb 2.0
audio gadget correctly so my device shows up as an audio interface
when I plug it into my PC or Mac. I previously was on 4.11 and had a
bunch of hacks I applied to the uac2 driver which worked fine, but a
lot has changed since then and I'm wondering if by now the gadget
works correctly out of the box, so I don't have to apply my hacks
anymore.

I'm configuring the device using configfs and that works fine, but
when I plug it into my Mac I just see zero channels and the device
name is capture or playback inactive.

Anyway, just wanted to know what the current state of things is
regarding the gadget driver and alsa.

Thanks
Bert
