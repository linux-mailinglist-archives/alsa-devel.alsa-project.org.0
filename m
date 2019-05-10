Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF6D198D9
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 09:17:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B1421AAE;
	Fri, 10 May 2019 09:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B1421AAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557472658;
	bh=KgKmA2UjY25a/xIFZpSHwfc2yHTCMD90GbwGMiIQu2Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CsUopK3lmOcy399M2X/YsOtw+inDe1t6lfyJk3sZEIPRUCnr+lgCqi1iCJ5uY4iHq
	 3WnGoCW3vR8d5myXaPNphiwb4fcf25f0htQfMrWC/oRb9Hm5P/G9ikaF67uyXsA2OZ
	 Amlbq1t2ikwUHyepFiZHStBM8uIZVU6GYtMfc/W0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90D3AF8970E;
	Fri, 10 May 2019 09:15:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD549F896FD; Fri, 10 May 2019 09:15:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B408F8073C
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 09:15:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B408F8073C
Received: from localhost (localhost [127.0.0.1])
 by bastet.se.axis.com (Postfix) with ESMTP id AB7B2184D9
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 09:15:47 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
 by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id dzidXKaBPA3C for <alsa-devel@alsa-project.org>;
 Fri, 10 May 2019 09:15:46 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
 by bastet.se.axis.com (Postfix) with ESMTPS id D2B8618577
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 09:15:46 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C064C1A072
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 09:15:46 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B57281A06F
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 09:15:46 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
 by boulder02.se.axis.com (Postfix) with ESMTP
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 09:15:46 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
 by thoth.se.axis.com (Postfix) with ESMTP id A9E6229C6
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 09:15:46 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX04.axis.com (10.0.5.18) with
 Microsoft SMTP Server (TLS) id 15.0.1365.1;
 Fri, 10 May 2019 09:15:46 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
 XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id 15.00.1365.000; 
 Fri, 10 May 2019 09:15:46 +0200
From: Mats Lindestam <mats.lindestam@axis.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: Alsa-loopback
Thread-Index: AQHVBvYrDYM2NHPnvE2oovx65zPOCQ==
Date: Fri, 10 May 2019 07:15:46 +0000
Message-ID: <1557472546239.42034@axis.com>
Accept-Language: sv-SE, en-US
Content-Language: sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Alsa-loopback
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,


I am new to Alsa and I have been told that there is some kind of buffer/queue, in Alsa-loopback, that regulates when 'sound-buffers' is dropped.

What I would like to achieve is make the buffer/queue larger (500 ms).


From what I have heard is that it should be possible to configure the buffer/queue, in Alsa-loopback, via the /etc/asound.conf configuration file.


It seems that the parameters period_time, period_size, buffer_time, buffer_size & rate are important to achieve what I want. I haven't found any information on what these parameters do and how or if they are used in conjunction with each other.


Here is my asound.conf file:


  # cat /etc/asound.conf
  pcm_slave.aloopcommon {
    pcm "hw:Loopback,0,0"
    ...
    rate 16000
    period_time 64000
    buffer_time 512000
  }

  pcm.!audiosource0 {
    type dsnoop
    ...
    slave aloopcommon
    ...
  }

Is there somewhere where these parameters are explained and how they interact?

BR

/Mats
?



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
