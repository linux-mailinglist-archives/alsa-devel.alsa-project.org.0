Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9669A4F35B3
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 15:53:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3293517EE;
	Tue,  5 Apr 2022 15:52:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3293517EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649166788;
	bh=Vll7HeCpe4fU7fbzS/9m20KFsxk9zFgWtMGjD90qQwo=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PsduUQYO9wTaayecPYmZIlSgbIl6RZXR1D3HG9JP1wnOY0qEt5ggaq9Eawb6rjdS1
	 lduVY3Ka3EaSChwGYqatK10NaZO0dLprw69cezPX4hhypXciRMnln3DKa/G3i/wXGS
	 nSRlORDv4jxdcXpTH3k1NbWh9Ee3Q0Qfky9PRQwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A96B9F8016B;
	Tue,  5 Apr 2022 15:52:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7420EF800D2; Tue,  5 Apr 2022 15:52:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2F4FF800D2
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 15:52:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2F4FF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="PKbbBxLz"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2356WHiA029192;
 Tue, 5 Apr 2022 08:52:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : from : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=qdlWSFWox8pqXhYTtt1fv3TfdyVH568avS9AMQTckt4=;
 b=PKbbBxLzsWnf3sZ3Gb91O1NnBu3X2FULdZyghJt+k/ySFZWpnEJbBhbq3OGlAckgvwzj
 GSY32edVAbCt+8WDbEuthhPwyhh2VLkwRz7eC7+wj9z0mXrj0Nqit67eYGvis5eK9qtD
 xmXrhvWrLiUnjygcvGcULUAX++Jv6U5i5hjIx3B6mUT4z9RzQao796w8nGlH0Wv+9A0e
 VQSVnANh6o6STWuVZEYWgUNYi8EWGYSyHqamITND2wrQENPTL3CWb9s2DlX6vkN92/An
 QcsFqq5zfOSs9WlKVqrekcZaRQ/0XCP28EhXuIcEADfYJanV/5toBpTefgsqZJjh+Wph EA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3f6jwnujw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 05 Apr 2022 08:51:59 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 5 Apr
 2022 14:51:49 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Tue, 5 Apr 2022 14:51:49 +0100
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.65.88])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EFB40458;
 Tue,  5 Apr 2022 13:51:48 +0000 (UTC)
Subject: Re: [PATCH 5/5] ASoC: cs35l45: Add driver for Cirrus Logic CS35L45
 Smart Amp
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>
References: <20220318162943.1578102-1-rf@opensource.cirrus.com>
 <20220318162943.1578102-6-rf@opensource.cirrus.com>
Message-ID: <b9059240-fe6b-6549-d22d-de4bc2ab0c85@opensource.cirrus.com>
Date: Tue, 5 Apr 2022 14:51:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220318162943.1578102-6-rf@opensource.cirrus.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1Q4LWg2XrZQXUi0dgcuoSCeoh3Ub3r62
X-Proofpoint-GUID: 1Q4LWg2XrZQXUi0dgcuoSCeoh3Ub3r62
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
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

On 18/03/2022 16:29, Richard Fitzgerald wrote:

> +static int cs35l45_i2c_probe(struct i2c_client *client,
> +			     const struct i2c_device_id *id)
> +{

Use the new .probe_new callback

> +static int cs35l45_spi_remove(struct spi_device *spi)
> +{

This is now a void return
