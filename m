Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 365462C98C9
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 09:06:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3D6C16CF;
	Tue,  1 Dec 2020 09:05:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3D6C16CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606809960;
	bh=lniwxISatJF+S9Xbuf8TAltr+GjgHXKWLfK5Kkbj4KU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HIprILn1WhH5KmD58+5Ai4XnpPsAXsI1MrbXstFlyCrXFk6hjWndy9GmlGgsr4SDP
	 Dgd+qsHpYCqImhGOYK05woiVJHu57m14QCWxH9Jp2YB0ibgD7KwOK1gh7frhb9l7Vi
	 OxAbK/4Gf2KoSJQVXpBxAZ6qXDSTthQ7aAJec6Po=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A42CBF80254;
	Tue,  1 Dec 2020 09:04:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1AD7F80158; Tue,  1 Dec 2020 09:04:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7D9CF80158
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 09:04:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7D9CF80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="ONa+YRUM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=lniwxISatJF+S9Xbuf8TAltr+GjgHXKWLfK5Kkbj4KU=; b=ONa+YRUMJj05Xzc+SiVtB8ZYQG
 A7pNP6l6z0sKPZuclQ4Zku0pJXE5qgnx717tmXNEPwdDgj6FSAhLEVBsSSBAV9Xns4ZZ6gaF7xl/3
 rvaSboBHLCKEa/Qc404Oak+u8/T8nZveSodpzcj6TrCvH+WGR/Qsd7m0+qX6N5LD+2fW6qZRpnWb2
 SREfljoAiHEs+ymJtRpmaCKWqjVcNvyV2QVcH7tQXI7pQeNTnsRYv56gIQshPqQm/hxyVzBVBT9HM
 e0b7GBDuDkEHULUIVCrx8lVlQSYhfqX+vbTMbRGTM9OffsePu2EJE2BwsaavvWEZnXCGH0E2MNzcd
 /eX3CTGQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1kk0dy-0000hH-OX; Tue, 01 Dec 2020 09:04:14 +0100
Received: from [62.216.202.54] (helo=[192.168.178.20])
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1kk0dy-000XVE-KI; Tue, 01 Dec 2020 09:04:14 +0100
Subject: Re: [PATCH] ASoC: adau1372: Add missing KConfig dependencies
To: Mark Brown <broonie@kernel.org>
References: <20201201075435.29909-1-lars@metafoo.de>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <7fe9edc1-eac9-aede-9480-dc0ca1f0dcc1@metafoo.de>
Date: Tue, 1 Dec 2020 09:04:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201201075435.29909-1-lars@metafoo.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26004/Mon Nov 30 15:29:06 2020)
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>
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

On 12/1/20 8:54 AM, Lars-Peter Clausen wrote:
> The I2C and SPI version of the adau1372 driver respectively depend on the
> I2C and SPI framework being enabled. Otherwise compile or linker errors
> will occur when building the driver.
>
> Add the proper Kconfig dependencies to ensure that the drivers are only
> selectable if the required framework is enabled.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
Ah, just saw Alexandre was faster. Please ignore this one.


