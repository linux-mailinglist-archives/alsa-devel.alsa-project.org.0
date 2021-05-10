Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F07379156
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 16:51:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3F011775;
	Mon, 10 May 2021 16:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3F011775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620658310;
	bh=aBdh/wezFvZYnucdQ6lULYoO0CfKGHXsByMCejcVDLo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VK+BChhVHHRfQv+jJl+Mx71wTlgnyAIk1Smh9V0AgeNZNUAG/Nh0kkgvF+JyGVtTW
	 9VQotAZZJ3HA8WnpNdKbQMxa2vNkWSGmJXRbyCo9V3MvgTvERVhnRuphN4vIlTeNOJ
	 UACY4ODb9yHSORPHnIWGl4MvvhoiovKQzQgEZyn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E8D7F80272;
	Mon, 10 May 2021 16:50:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01077F80240; Mon, 10 May 2021 12:53:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC8D5F800B4
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 12:52:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC8D5F800B4
Received: from ip4d14bd53.dynamic.kabel-deutschland.de ([77.20.189.83]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1lg3Wn-0008EG-Lc; Mon, 10 May 2021 12:52:45 +0200
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
From: Thorsten Leemhuis <linux@leemhuis.info>
Message-ID: <c4479ced-f4d8-1a1e-ee54-9abc55344187@leemhuis.info>
Date: Mon, 10 May 2021 12:52:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cover.1620641727.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-BS
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1620643980;735e3835;
X-HE-SMSGID: 1lg3Wn-0008EG-Lc
X-Mailman-Approved-At: Mon, 10 May 2021 16:50:04 +0200
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, x86@kernel.org, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-sgx@vger.kernel.org, coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-integrity@vger.kernel.org
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


On 10.05.21 12:26, Mauro Carvalho Chehab wrote:
>
> As Linux developers are all around the globe, and not everybody has UTF-8
> as their default charset, better to use UTF-8 only on cases where it is really
> needed.
> […]
> The remaining patches on series address such cases on *.rst files and 
> inside the Documentation/ABI, using this perl map table in order to do the
> charset conversion:
> 
> my %char_map = (
> […]
> 	0x2013 => '-',		# EN DASH
> 	0x2014 => '-',		# EM DASH

I might be performing bike shedding here, but wouldn't it be better to
replace those two with "--", as explained in
https://en.wikipedia.org/wiki/Dash#Approximating_the_em_dash_with_two_or_three_hyphens

For EM DASH there seems to be even "---", but I'd say that is a bit too
much.

Or do you fear the extra work as some lines then might break the
80-character limit then?

Ciao, Thorsten
