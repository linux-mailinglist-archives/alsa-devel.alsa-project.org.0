Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 902682A4AE8
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 17:14:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25F8F16A8;
	Tue,  3 Nov 2020 17:13:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25F8F16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604420055;
	bh=ZAwy1SyCHUV+1HTbl2YK9B/0PuANQqx/C+z/bSEyiwM=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DnLmE0x/NvLqGaKwTz35m0cYqRcKyZqHLderkmNiqGovSpgaU9YMrF6rAtbM9y2PY
	 uoyK6bs2UD6TXOZJWK2p7HS5mIpTGD6qs1cTdtAP1/bRkHV3XIuc6dYQxRy6Alit0B
	 33G+q4dir8CZ3uarwJ28E0hknA8UayN/+vH9lM9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 917A6F80272;
	Tue,  3 Nov 2020 17:12:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7968F80171; Tue,  3 Nov 2020 17:12:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 NICE_REPLY_A, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from webclient5.webclient5.de (webclient5.webclient5.de
 [IPv6:2a01:4f8:212:88::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98522F80083
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 17:12:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98522F80083
Received: from [10.1.0.120] (unknown [94.101.37.79])
 by webclient5.webclient5.de (Postfix) with ESMTPSA id 76A3E56205C4
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 17:12:34 +0100 (CET)
Subject: Re: snd_bt87x on Kworld KW-TV878RF
To: alsa-devel@alsa-project.org
References: <CAOoeSP+sPgxziFPPTWsCWHTK7cotXQPxJiZwJnj6ciEpK06zsA@mail.gmail.com>
From: Clemens Ladisch <clemens@ladisch.de>
Message-ID: <ef21f7ca-7f79-c59b-9e9b-d90c8bf4db97@ladisch.de>
Date: Tue, 3 Nov 2020 17:13:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAOoeSP+sPgxziFPPTWsCWHTK7cotXQPxJiZwJnj6ciEpK06zsA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.101.5 at webclient5
X-Virus-Status: Clean
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

Tamás Hámor wrote:
> I load ... snd-bt87x with "load_all".

Does it work?


Regards,
Clemens
