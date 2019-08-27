Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA999F106
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 19:00:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB8591667;
	Tue, 27 Aug 2019 18:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB8591667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566925227;
	bh=exsuo9KBIo9q3d1wIIfo3Hncv9weCe2HfWhS+5jMw88=;
	h=From:In-Reply-To:Date:References:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=De+YDur5mc/ZSRZH2B2kCZWaD0KEbXjiJLSjvptpKURD7iTxZ1uv42CTM4lmoUKtY
	 kkx/Lze+bXjW09j6OpqNHNCnG58dtHGQ4Joz7Ikc3wO4uXUgZVQdDvWHtW8kBBaiwZ
	 ZYbIJhulFgX63e3GNKLREKw/CqAIK/e9bYndwYP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C34DF80274;
	Tue, 27 Aug 2019 18:58:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F9C7F80142; Tue, 27 Aug 2019 18:58:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2EA3F80142
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 18:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2EA3F80142
Received: from mail-pg1-f199.google.com ([209.85.215.199])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1i2enk-0000v8-Fl
 for alsa-devel@alsa-project.org; Tue, 27 Aug 2019 16:58:36 +0000
Received: by mail-pg1-f199.google.com with SMTP id a9so12150419pga.16
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 09:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ZmU+i265kgZh9bO9prSg01z0i65nfx2GaSB2O7bSk90=;
 b=RtnDP5+XCndGacOlM579m55Veq4zE2Y1nunN0XXvss0HGTIYYKEvzzoh3aZQ2PED45
 gASWv84InhR2J2VK93Z5VYC/4kdwucb4RGDqao4RpVLJedi0V3jGxw0AMMysx38ecuJF
 nI3PSc42SgnnntmKP0jIibtcOnidScyj+YdbTRlJ/rXgJzlS/tJVBNMI6HZRRzvSnzXz
 mf2Z2J2h0xP6u7uw5SeMnJdyB7cX+CQp3eY7eD3NYlTqg0Mq+impqgvT75ISGGqpEPij
 lsJq0wgG5ak/ftdO8GsmTsLbrAIh9Zo9uDOZE+vwoBY4aYA/My/uh1ZqXGHr+8BdKnYf
 jWmQ==
X-Gm-Message-State: APjAAAUkEMIFLgsR6omVbl2aY9mBgGKzoiqghofR1Xma2a9zJkWG3cHs
 ZGkcxQ780GKkj76qw9Vki5f4SSlFHu7lPY9sg9jYNzVa7sznzwHpDeTsp24BmAffg71Y4xxJakA
 0JmHsIj9Ng2aeim2ykawvo5LisT8GnvM9H4f0bD5F
X-Received: by 2002:a63:1:: with SMTP id 1mr21851573pga.162.1566925115214;
 Tue, 27 Aug 2019 09:58:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwUUxXXgspEoNOIqmfJkQtVmAN7fCfHHbqIOIjA5f1KoSAP1aqHJ2qIScW920OpXslsUi9dnA==
X-Received: by 2002:a63:1:: with SMTP id 1mr21851540pga.162.1566925114765;
 Tue, 27 Aug 2019 09:58:34 -0700 (PDT)
Received: from 2001-b011-380f-3c42-843f-e5eb-ba09-2e70.dynamic-ip6.hinet.net
 (2001-b011-380f-3c42-843f-e5eb-ba09-2e70.dynamic-ip6.hinet.net.
 [2001:b011:380f:3c42:843f:e5eb:ba09:2e70])
 by smtp.gmail.com with ESMTPSA id q22sm17660250pgh.49.2019.08.27.09.58.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 09:58:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5hr2567hrd.wl-tiwai@suse.de>
Date: Wed, 28 Aug 2019 00:58:28 +0800
Message-Id: <0379E973-651A-442C-AF74-51702388F55D@canonical.com>
References: <20190827134756.10807-1-kai.heng.feng@canonical.com>
 <s5hr2567hrd.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3445.104.11)
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 1/2] PCI: Add a helper to check Power
 Resource Requirements _PR3 existence
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

at 23:25, Takashi Iwai <tiwai@suse.de> wrote:

> On Tue, 27 Aug 2019 15:47:55 +0200,
> Kai-Heng Feng wrote:
>> A driver may want to know the existence of _PR3, to choose different
>> runtime suspend behavior. A user will be add in next patch.
>>
>> This is mostly the same as nouveau_pr3_present().
>
> Then it'd be nice to clean up the nouveau part, too?

nouveau_pr3_present() may call pci_d3cold_disable(), and my intention is to  
only check the presence of _PR3 (i.e. a dGPU) without touching anything.

Kai-Heng

>
>
> thanks,
>
> Takashi


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
