Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5022FB9D6
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 15:54:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C59418A9;
	Tue, 19 Jan 2021 15:53:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C59418A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611068066;
	bh=QPhNHpYLf8K43bbBe2vUJNGQhTMqf+hpynKlYdc/Unc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bOND24b9rDkojW9DP3ipFgQoKih/5xdXP3eja90a8GP/ATzMU8f/rEhj7L3CRuHJF
	 zJThSdXBsP43SS8KuDtTc7T3OdViixRhhN8M9fBqwmmk0grXTkZA3jiNLn3Y71sym7
	 YKFQHf6tbBmKImvyb0ZcT+WIB4nJtaIyVyuRGUr8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03DAEF80137;
	Tue, 19 Jan 2021 15:53:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7635F8029B; Tue, 19 Jan 2021 15:53:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8848BF80137
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 15:53:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8848BF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DWO7Zl2V"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C417723134;
 Tue, 19 Jan 2021 14:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611067997;
 bh=QPhNHpYLf8K43bbBe2vUJNGQhTMqf+hpynKlYdc/Unc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DWO7Zl2VVzOo85L1C2uHGV1g/CHSOxzU1P5tVKki8caVNM3L+cFhQrxosJpXi3xAx
 nQ81ubtZo8ehJ08WlMx8CwUKCh82QRX5/Rm5UtRZPBaFpGIYdULCR5UKME+pWp91D5
 UIbuPwqJdJDg7Ak4pdQZ4WkzUNaNIp4sJOh6DmByOgferdmnySE8ZBuTfRkz5GnD03
 QT5ZT1xSgfUVfo2MyhHkSSrGR9K8F06Trio+yZFFPt+7zLj67yKRFsredxt2NTYFCB
 W19IvpCX9cUGAyWxVcJSxg8t+L6JF4Btc6+BelmcCOpwYqf/2UwgYOqC858Wq4efME
 eCdNB3ER3vmHA==
Date: Tue, 19 Jan 2021 20:23:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: Re: [PATCH V2] soundwire: sysfs: Constify static struct
 attribute_group
Message-ID: <20210119145309.GU2771@vkoul-mobl>
References: <20210117220611.30921-1-rikard.falkeborn@gmail.com>
 <20210117221622.34315-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210117221622.34315-1-rikard.falkeborn@gmail.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On 17-01-21, 23:16, Rikard Falkeborn wrote:
> The only place sdw_slave_dev_attr_group is used is when its address is
> passed to devm_device_add_group() which takes a pointer to const struct
> attribute_group. Make it const to allow the compiler to put it in
> read-only memory. This makes all attribute_group structs in the file
> const. Done with the help of Coccinelle.

Applied, thanks

-- 
~Vinod
