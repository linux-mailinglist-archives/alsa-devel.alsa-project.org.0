Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C5D5EED75
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 08:00:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A04F74C;
	Thu, 29 Sep 2022 07:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A04F74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664431239;
	bh=UVp3DIcIhXLorPqq9KB13nx8mC+qNarvyB1UOm88vTA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sxrhJgcF3mw6lGKbyI4NVFMFNEN6LEX6+cJiJdXiA+LNcOpYGwq5M1x6EpB0LRZ1e
	 GA8X89stn8hQtYVeNhqQ4wRzbSNO7PdXcfDqt3ti1nMLpKeWbzyYmduI+Xz/SliuI2
	 wjcMmsh3SZ4wSrj7CZi8pfmpb65l6geYSjH+iMTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD520F803DD;
	Thu, 29 Sep 2022 07:59:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 823BEF8023A; Thu, 29 Sep 2022 07:59:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0215BF80109
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 07:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0215BF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="OcpQjrOL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=NXUihHm0xOJUlsVS7RXSAPp6feiEX61IX5jpUCvHJSU=; b=OcpQjrOLrFI18JmVeNjMrL9A1R
 7tJ1vb91/D4zIehcuQeDcXBgWEWc9Xl+xmL5BKXwJO/AqA/okBi8EZrRVVvUxb/1Zr5iyXjBml9tc
 YbeJ8XmbynCK9wb8v/5M63FoBnnjKW4XC9q5a2OBI5uWqeJ/fUx+0oN2qsJpTN7EhxMVSsGrC6xMC
 3X6pSYDb7hAkiTSJSu8KW30+9B0q31u03Mhj8cdkCTX649Naya6CuUGoYpjQxOhm3is6F2spQh+GQ
 445tRdvylO9aKMliyOLsUycg1wqMdsxlOo4IrzkvrL56/Dk500SXnQRNW3xk4vcSTbo320eV3zJvB
 k3QT6HxA==;
Received: from [2601:1c2:d80:3110::a2e7]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1odma5-001K2m-0M; Thu, 29 Sep 2022 05:59:33 +0000
Message-ID: <d0c824e3-11fb-6002-982d-c15916f060d8@infradead.org>
Date: Wed, 28 Sep 2022 22:59:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: linux-next: Tree for Sep 28 (Kconfig: SND_SOC_QDSP6)
Content-Language: en-US
To: broonie@kernel.org, Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220928192605.247546-1-broonie@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220928192605.247546-1-broonie@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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



On 9/28/22 12:26, broonie@kernel.org wrote:
> Hi all,
> 
> Changes since 20220927:
> 

on x86_64, when QCOM_APR is not set and COMPILE_TEST=y:

WARNING: unmet direct dependencies detected for SND_SOC_QDSP6
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y] && QCOM_APR [=n] && COMMON_CLK [=y]
  Selected by [y]:
  - SND_SOC_SC8280XP [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y] && (QCOM_APR [=n] || COMPILE_TEST [=y]) && SOUNDWIRE [=y] && COMMON_CLK [=y]



-- 
~Randy
