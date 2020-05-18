Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BCF1D7584
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 12:48:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A543516DA;
	Mon, 18 May 2020 12:47:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A543516DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589798901;
	bh=VEeYrqW4hKLeoiZjyajk4f1vhls2Lu+HQGvWm6+RHvk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=unbieaMuqF0jbJXbkYfG/mA44O4GhK5XdE/uJnzh8zZFkZpkaYzFrjTkHInbqVeNk
	 40gAvZzKyMV0H2LfYDsJxASt9HH5m1c59oJB27ubs/sruSzogpZsCn8ut4oM/718QL
	 iwFrjxfmdTAdBOHIncKnEeAO2CHdmf/bktMfIGTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC9ACF801D8;
	Mon, 18 May 2020 12:46:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0A0BF801DA; Mon, 18 May 2020 12:46:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from cmccmta1.chinamobile.com (cmccmta1.chinamobile.com
 [221.176.66.79])
 by alsa1.perex.cz (Postfix) with ESMTP id 3047FF8015C
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 12:46:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3047FF8015C
Received: from spf.mail.chinamobile.com (unknown[172.16.121.17]) by
 rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee35ec26770d05-373f9;
 Mon, 18 May 2020 18:46:08 +0800 (CST)
X-RM-TRANSID: 2ee35ec26770d05-373f9
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [172.20.146.121] (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee95ec2676e50b-b7d11;
 Mon, 18 May 2020 18:46:07 +0800 (CST)
X-RM-TRANSID: 2ee95ec2676e50b-b7d11
Subject: Re: [PATCH] ASoC: fsl_micfil: Fix format and unused assignment
To: Mark Brown <broonie@kernel.org>
References: <20200518074405.14880-1-tangbin@cmss.chinamobile.com>
 <20200518102513.GA8699@sirena.org.uk>
From: Tang Bin <tangbin@cmss.chinamobile.com>
Message-ID: <9ab0ef1f-6acf-ac5a-9d16-e00fbb39ae11@cmss.chinamobile.com>
Date: Mon, 18 May 2020 18:47:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200518102513.GA8699@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com,
 linuxppc-dev@lists.ozlabs.org
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


On 2020/5/18 18:25, Mark Brown wrote:
> On Mon, May 18, 2020 at 03:44:05PM +0800, Tang Bin wrote:
>> In the function fsl_micfil_startup(), the two lines of dev_err()
>> can be shortened to one line. And delete unused initialized value
>> of 'ret', because it will be assigned by the function
>> fsl_micfil_set_mclk_rate().
> This is two separate changes with no overlap so would have been better
> sent as separate patches.

Got it, Thanks

Tang Bin



