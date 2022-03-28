Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 253E94E930A
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 13:11:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A34DE174C;
	Mon, 28 Mar 2022 13:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A34DE174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648465866;
	bh=dUqAVLvRN0zWckdC8lYFq9LPAv6eD+wzcTa3IBt3umI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZpEBZ3Qm/6iHZNidIpYlLKuO3gdfx1Ht/u2LYQps9Yp8T1liFZnsvrOzwf5yzOBXa
	 VOQKYVD8hhNCU9t4gYgRD14UAXvWRQSh6ZWMiWqf+1FeVNJna4/8e9ej3a1AjpJ7D/
	 9AQvMPNEDOG5z8kB0VNc+qL/v68ob8sP2i/+OABE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18E09F800CB;
	Mon, 28 Mar 2022 13:10:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C851FF8024C; Mon, 28 Mar 2022 13:09:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EB91F800CB
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 13:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EB91F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="gWIbvTNa"
Received: from [192.168.0.108] (unknown [123.112.67.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 7696D3F75F; 
 Mon, 28 Mar 2022 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1648465788;
 bh=dUqAVLvRN0zWckdC8lYFq9LPAv6eD+wzcTa3IBt3umI=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=gWIbvTNaGbApwDUqELgDF0mE7zgoefoMN+oNLAT0/KjSzbrLcuM/Ko9KwQbeTGngE
 46X4grl4poOI1Lj/iutcs0HGtA/pFo5os3i8lyJgWAB0Zk+kKObauuxa/xqF8O+tQ8
 Wfy8pp31PcoPOIEhpfc07w/MkqZAbrmyBww1prbVec6MlFE9ZWHsQcc0gzN/iTtl+H
 6fg1VZPYsKMzTZn+FLACoMo+RnKJ+RbdfCZmyp35xE0T27o6mdkGfNWmDixY2QziPi
 Cymqfhv+1YgpscrJhg2OsJMbNzw+tGEcYEnNpNxiGr+3+tuA/d+yRN1hKNDCXwbD8e
 mKzATB3Q1ZvUw==
Message-ID: <5d0b581b-5b82-4367-81e5-31d362351d8a@canonical.com>
Date: Mon, 28 Mar 2022 19:09:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] ASoC: cs35l41: Don't hard-code the number of
 otp_elem in the array
Content-Language: en-US
To: Lucas tanure <tanureal@opensource.cirrus.com>,
 alsa-devel@alsa-project.org, broonie@kernel.org,
 patches@opensource.cirrus.com, ckeepax@opensource.cirrus.com
References: <20220328042210.37660-1-hui.wang@canonical.com>
 <20220328042210.37660-2-hui.wang@canonical.com>
 <263781d6-00d5-dd7a-d7a1-dc102448811d@opensource.cirrus.com>
From: Hui Wang <hui.wang@canonical.com>
In-Reply-To: <263781d6-00d5-dd7a-d7a1-dc102448811d@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 3/28/22 16:56, Lucas tanure wrote:
> On 3/28/22 05:22, Hui Wang wrote:
>> The CS35L41_NUM_OTP_ELEM is 100, but only 99 entries are defined in
>> the array otp_map_1/2[CS35L41_NUM_OTP_ELEM], this will trigger UBSAN
>> to report a shift-out-of-bounds warning in the cs35l41_otp_unpack()
>> since the last entry in the array will resuilt in GENMASK(-1, 0).
> result
>>
>> To fix it, removing the definition CS35L41_NUM_OTP_ELEM and use
>> ARRAY_SIZE to calculate the number of elements dynamically.
> This a plain out-of-bounds access issue, you could just say that.
> And at the end, you could say that UBSAN reported the issue.
>
> Also the title should start with Fix, like:
> "Fix out-of-bounds access in cs35l41_otp_packed_element_t"
>
>>
> Fixes: 6450ef559056 ("ASoC: cs35l41: CS35L41 Boosted Smart Amplifier")
>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
>
> You are missing the Fixes tag.
>
OK, got it, will address all comment.

Thanks.

