Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B861572D
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 03:08:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A07318E2;
	Tue,  7 May 2019 03:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A07318E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557191308;
	bh=EUDZKaG5sBBLxxaoz9PSjiI7BPPs+dO/tukgs0vjvDw=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R9nsn+lb+4ABLr7xaFb+Rt5rZ0Y0jq/tbykmTI3q6MdmQVedHgg1MkI6DGRKV7bkQ
	 qRDfhQez2oY2nV9p5MMX+nhcUEXCv8906GI4w8rGT1ynSkj1icBQpSpVlSd7UXXiTx
	 erTOLAdxUG/pV3OGXILYs6AtYFRkOXtZrLP1/86o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A922CF896F0;
	Tue,  7 May 2019 03:06:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82784F896F0; Tue,  7 May 2019 03:06:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mx.flatmax.org (mx.flatmax.org [13.55.16.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE4F2F80C07
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 03:06:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE4F2F80C07
Received: from pa49-180-155-104.pa.nsw.optusnet.com.au ([49.180.155.104]
 helo=[192.168.1.51])
 by mx.flatmax.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <flatmax@flatmax.org>)
 id 1hNoYv-0001kj-5R; Tue, 07 May 2019 11:06:30 +1000
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
From: Matt Flax <flatmax@flatmax.org>
Message-ID: <bdc0a30f-c6f3-8ccb-f556-1d1a6a68f3b9@flatmax.org>
Date: Tue, 7 May 2019 11:06:28 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-AU
Subject: [alsa-devel] cs4265 : alsactl store and "C data buffer" fails
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

When alsactl store is run with a cs4265 chip, the following error occurs 
(from https://github.com/Audio-Injector/Ultra/issues/25) :

$ sudo alsactl store
alsactl: get_control:256: Cannot read control '2,0,0,C Data Buffer,0': 
Input/output error


Upon commenting out the C data buffer control it works :

https://github.com/torvalds/linux/blob/master/sound/soc/codecs/cs4265.c#L163


Can you suggest a suitable method for fixing this bug ?


thanks

Matt

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
