Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E14610F30
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 12:58:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE8A9282C;
	Fri, 28 Oct 2022 12:58:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE8A9282C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666954732;
	bh=0TWRiNHkRWz2/5Q6vKc6rQKaov2+BABDZKgy9CWEHTI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EbaK6H2npzwHcwfmLNmq0ByOqwh78leC345naoRjy9OIi6GVwt9ALbl3Dna3fH3V5
	 FAr0Eu5t5wsHRMRsDdkSz3Hqs5PfLZib8GLNQUAami/pEqm8FVakkgdX+Zo7IP7ir6
	 z6lHDaVjpRefdAZHlO5qofoX+heAgM7O4TGfsRbg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B8ACF8025A;
	Fri, 28 Oct 2022 12:57:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94130F800E1; Fri, 28 Oct 2022 12:57:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D9B2F800E1
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 12:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D9B2F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=berginkonsult.se header.i=@berginkonsult.se
 header.b="Q9XIX7ky"; 
 dkim=permerror (0-bit key) header.d=berginkonsult.se
 header.i=@berginkonsult.se header.b="JOB1ie2S"
Received: from mailrelay2.pub.mailoutpod2-cph3.one.com
 (mailrelay2.pub.mailoutpod2-cph3.one.com [104.37.34.7])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPS
 id 6065be58-56af-11ed-be8b-d0431ea8bb03;
 Fri, 28 Oct 2022 10:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=berginkonsult.se; s=rsa1;
 h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
 subject:mime-version:date:message-id:from;
 bh=kA29Uae9pNDmiilF2kxIxk5SKCRQrz1myBuRn56hAdU=;
 b=Q9XIX7kycrYm+IYy9u6s+j8QsOjSiUX2AAzgjeD5S+sYpmU+QqeBGx/2lz6Oeh9zcxNTz60eY8W76
 1w5JHfLpT+eAMzrPGWbkenhvTydqNJkbKoMa1R+gYRcriLLkjnvbnLekI5sBSC8IIS+UhoPG4PnCzQ
 7BstZQTUgVzNRYZm6NTfCEBC+c3PdccZtum4NvfiBTIBzR6bD4r+siEhZXWheyGd16M4UOQF/Fh53F
 lbI2NFWKvWpR5ARm5vHm28CFXNBkwzY6dj3GfC0uvc4UbSWR2JlcJHnlOZTEhhVT50NPlrB+io3R7l
 GQKLZlM7ZPhAAKAGSk+VTx02ubS4Grg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=berginkonsult.se; s=ed1;
 h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
 subject:mime-version:date:message-id:from;
 bh=kA29Uae9pNDmiilF2kxIxk5SKCRQrz1myBuRn56hAdU=;
 b=JOB1ie2St9eIjmYsI90Y0f+3pKIyVxdRqaDj7qAL//04kcPn8fbs9qIONm28PRamML1Ye88NqSham
 KIvFe+xBg==
X-HalOne-ID: 5fdb2752-56af-11ed-ad16-335755252108
Received: from [192.168.100.34] (ua-213-113-159-147.bbcust.telenor.se
 [213.113.159.147]) by mailrelay2 (Halon) with ESMTPSA
 id 5fdb2752-56af-11ed-ad16-335755252108;
 Fri, 28 Oct 2022 10:57:55 +0000 (UTC)
Message-ID: <35dadf46-862b-f174-9870-7685a6945389@berginkonsult.se>
Date: Fri, 28 Oct 2022 12:57:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] ASoC: cs42xx8-i2c.c: add module device table for of
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20221027115057.442925-1-peter@berginkonsult.se>
 <20221028075045.493191-1-peter@berginkonsult.se>
 <Y1u1Hl7GaTlS/jeF@sirena.org.uk>
From: Peter Bergin <peter@berginkonsult.se>
In-Reply-To: <Y1u1Hl7GaTlS/jeF@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tanureal@opensource.cirrus.com,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, rf@opensource.cirrus.com,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 linux-kernel@vger.kernel.org
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

On 2022-10-28 12:55, Mark Brown wrote:
> On Fri, Oct 28, 2022 at 09:50:44AM +0200, Peter Bergin wrote:
>> When trying to connect the device with the driver through
>> device-tree it is not working. The of_device_id is defined in
>> cs42xx8.c but is not correctly included in cs42xx8-i2c.c.
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.

Thanks for the instructions! Will follow on the next update. I'm new to 
this and trying to learn, pointers like this are very welcome. :-)

Best regards,
/Peter

