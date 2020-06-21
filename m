Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F13202DB0
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 01:36:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F10E51675;
	Mon, 22 Jun 2020 01:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F10E51675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592782598;
	bh=W8kZXpcfmOusXfXo2/vgBybV1csqrf5weDBsejZCvqM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=drcsXz5KAVxcXj2Uc65A9nrSXEiR6wAOj9hjuoUaqvZrZvB5j49JanLBvlc1j90im
	 U2TrrJ5RG3uPNvuxZSzPdGvQR5tWl1N2CRDNXAoM05oIvV+n/QzItHSeIBp8+MGAO1
	 DnN0P9tv8jTtu+hTWMj9u+344i7Jy/wXcgFO4h8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96EA3F80218;
	Mon, 22 Jun 2020 01:35:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1645F80249; Mon, 22 Jun 2020 01:35:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1626F8023E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 01:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1626F8023E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HJ7Fy/oF"
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 68816252F5;
 Sun, 21 Jun 2020 23:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592782494;
 bh=W8kZXpcfmOusXfXo2/vgBybV1csqrf5weDBsejZCvqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HJ7Fy/oFMKqv5SRpIDwlXibmw/vihc2j0r2Da3mJn/Tm4kGtZG0WoUHHD7UPuhL0N
 ZGutB3R4M5Fjo/9GKqTEf6BgxdL8zdxO86bvH5Vjoe/oQfxhl+ArIcNzfPtgxgmhRc
 9DzC9KXiaXkMEbr67jzl3o77h4WHNdpz2ri2iiJc=
Date: Sun, 21 Jun 2020 19:34:53 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.7 130/388] ASoC: Fix wrong dependency of da7210
 and wm8983
Message-ID: <20200621233453.GB1931@sasha-vm>
References: <20200618010805.600873-1-sashal@kernel.org>
 <20200618010805.600873-130-sashal@kernel.org>
 <20200618110258.GD5789@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200618110258.GD5789@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, Wei Li <liwei391@huawei.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Thu, Jun 18, 2020 at 12:02:58PM +0100, Mark Brown wrote:
>On Wed, Jun 17, 2020 at 09:03:47PM -0400, Sasha Levin wrote:
>> From: Wei Li <liwei391@huawei.com>
>>
>> [ Upstream commit c1c050ee74d67aeb879fd38e3a07139d7fdb79f4 ]
>>
>> As these two drivers support I2C and SPI, we should add the SND_SOC_I2C_AND_SPI
>> dependency instead.
>
>This is purely about build testing, are you sure this is stable
>material?

Is this not something that can happen in practice?

-- 
Thanks,
Sasha
