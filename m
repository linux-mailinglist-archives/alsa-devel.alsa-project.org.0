Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD27596A55
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 09:26:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CD41E12;
	Wed, 17 Aug 2022 09:25:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CD41E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660721179;
	bh=64K04OIAsAM/hqlePyze1mYqqu+ttGsmCQGJcVaNhOw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YPE7onZWiYqGdYj2YHP1SzZP5Y5N8jXlq2MWuiKgaK1nO2B4q0NMpT+D1AJt15swu
	 0RP63VbRtNucPBRm8dPKMPZl9OAfEjC8Q0JI8hzvWjhItTZ6URKdLLze47mJzLyQuZ
	 Nxbz1wmIU530p59THQzuw7vxDEFPoYEnXcg6kydM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16D67F802D2;
	Wed, 17 Aug 2022 09:25:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4B84F800DA; Wed, 17 Aug 2022 09:25:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AFFBF800DA
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 09:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AFFBF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="h8J7r4Ll"
Received: by mail-pg1-x534.google.com with SMTP id q16so11297761pgq.6
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 00:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc;
 bh=64K04OIAsAM/hqlePyze1mYqqu+ttGsmCQGJcVaNhOw=;
 b=h8J7r4LlIg1NdbOyQu+4uqKXnnVPaRRcxJ2IoLFOgyis0krpp7/so2YqMCwBcajM8A
 nRg2k05ECFLf7bUNAfFJKeZOXEbv3AIVc6P9iWVqbC0ZDLhX98YjMIh1/bZkpjcA1i/P
 oFvxJz4KUOj6O0zNcAhdXOEJeBidEAZ5f5mtKlC5AkFcQjuWN5WgQO2TWKSY2Gy8+yuo
 NyVnF+UEC/x5H51PmdrerWn7uKfFb93TiWOCUqAZ7HYJe+eW3L479C/HnX8cxxLY0Faw
 jwGBVwOZ0OfE6I1BsVX2cKIcTzq2YQ/vaecAXckZnbop7Dl0F6QZpXb/fRD+AnZJT3Kp
 oNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc;
 bh=64K04OIAsAM/hqlePyze1mYqqu+ttGsmCQGJcVaNhOw=;
 b=QRd9HHblG6wMHc2E1U6GtXvQ68s77SOTUpCCQNvqH6No7Qljt6HMRJekXSGOmsd6bI
 tNGRaj06najErkHtrr81swE9bLz9McP9MOlq7r2HPzbRwWKFf54HjbHmTv9ChDUO0lhg
 E42ee4HbaGDU5CXFRxgNcTfUf7Sc2zsB7HuAtsasKwofmz+Gj3/d0ywk4GDQ+yeCifB8
 3eDnN20MBNGc3pNUY/QIGRZ+1CqRwPZl4JITDX8h47MDDwg4uxa47EUTLdcnLsWghd43
 T6KR0l5lENMhA2sXxrMDCSyFLq17awVyvCY74+PXaBkCQQk1LncCIEroZuJB+0tA1ilH
 xr9A==
X-Gm-Message-State: ACgBeo0zQihbi3MPjFMijhIc+mTYqV3goBY1/8WlIo3fyGtFZD6ODgNi
 4TPLody18Vi+P8PzhvVmwug=
X-Google-Smtp-Source: AA6agR6Oiwb8hLjkIeXhquUAGFHXE09FyiPgzxcxeXa06gNEgirQcwGSmkYu4JCZ4Wn9UfUllTS+eg==
X-Received: by 2002:a65:6e49:0:b0:429:cae6:aac6 with SMTP id
 be9-20020a656e49000000b00429cae6aac6mr1889023pgb.268.1660721109715; 
 Wed, 17 Aug 2022 00:25:09 -0700 (PDT)
Received: from [127.0.0.1] ([103.230.104.51]) by smtp.gmail.com with ESMTPSA id
 v4-20020a170902b7c400b0016dbdf7b97bsm638846plz.266.2022.08.17.00.25.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 00:25:09 -0700 (PDT)
Date: Wed, 17 Aug 2022 13:25:02 +0600
From: Khalid Masum <khalid.masum.92@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 linux-next] Remove Unnecessary TODO
User-Agent: K-9 Mail for Android
In-Reply-To: <a92f5041-9630-66ee-1757-4b58bdaabe90@linux.intel.com>
References: <20220816175954.5259-1-khalid.masum.92@gmail.com>
 <a92f5041-9630-66ee-1757-4b58bdaabe90@linux.intel.com>
Message-ID: <7B894BF2-45AD-44A1-91CA-5380B5DE4657@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
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



On August 17, 2022 12:31:20 PM GMT+06:00, Pierre-Louis Bossart <pierre-lou=
is=2Ebossart@linux=2Eintel=2Ecom> wrote:
>
>
>On 8/16/22 19:59, Khalid Masum wrote:
>> The capabilities enabled for multi-link are required as part of the
>> programming sequences, even when a stream uses a single link we still
>> use the syncArm/syncGo sequences=2E Therefore the TODO is no longer
>> necessary=2E
>>=20
>> Suggested-by: Pierre-Louis Bossart <pierre-louis=2Ebossart@linux=2Einte=
l=2Ecom>
>> Signed-off-by: Khalid Masum <khalid=2Emasum=2E92@gmail=2Ecom>
>
>the title of your patch should be something like
>
>soundwire: intel: remove unnecessary TODO
>

You are right=2E I shall send the patch with the title fixed soon=2E

-- Khalid Masum=20
