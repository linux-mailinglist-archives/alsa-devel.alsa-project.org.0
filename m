Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 975CD7B403
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 22:07:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16D7B179F;
	Tue, 30 Jul 2019 22:06:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16D7B179F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564517230;
	bh=Ybefdgj2EG/3dNpYyXNlEIJTfo0T/eG0TTwFD7SOBzg=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gMkAf4pOqL1aeKXqf25rTOmd5rjHnDSlm1Jgi25S34mWujkn67cFlbfRYmNRPK6B/
	 cFY58WbmK9TH2jkf99wMwtq3iJjMtVzF8lISMAtf0PXsUFbLxiKsZ3ry53uWKvZA5s
	 qFfLw5k7uJyfGaRkvyxOE5YAcvrYCEFqXUkN9kmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5886EF804CC;
	Tue, 30 Jul 2019 22:05:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56407F804CA; Tue, 30 Jul 2019 22:05:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B358F80214;
 Tue, 30 Jul 2019 22:05:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B358F80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TYOfW49G"
Received: by mail-wr1-x42a.google.com with SMTP id f9so67065058wre.12;
 Tue, 30 Jul 2019 13:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=8fDLcl7hMABH4NEX+7Luwwr2IWzNS+YwBhJd3diPGOk=;
 b=TYOfW49GCxizV00V+hBjeGCw7PLPAsozugmlkJh/ZqIMxKJEhZLiMSPOleV5hrmBpr
 uOprxB+9PuB/oOIlRfF1WKeSp9Wep7lZCrSfjKFl+57g6wYghDcE1J1nhCDmGJ/787Yp
 uqnGyMtsWwo//M1fJLy/u2HV3RqJdp1+dpaPwnmNBR3ZwQeOCpZq0i3JyihdoQUMwF2v
 PJS+ElKEOnZIChHdoqe5dmgIpuSrJzucs52B3l60nJBUv+6fbBhz4Y+oNjoEfHdR5O4O
 uj+3a2Rh6XK9KkpW3uqpEIyGMIqSbhufh1PF+6+JeUs9mJYKm63AfPBM2gDmJZXJ2ifk
 X5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=8fDLcl7hMABH4NEX+7Luwwr2IWzNS+YwBhJd3diPGOk=;
 b=FngwM/RrhB/yX/KqKHeQz64gLNg+AIqfe6SECLl/d2DIdcF/xM2mRdbRy1i8pF9xof
 7lAVbbb4iv47U8qSlwyQrZnL5WSyTOZm6Dg5dTtJHIXs081VZb7e5H8kZRcGfU5euixv
 j/UXLLEpPivRBgTVefo/HWl1AEgycTaLoeOrw8H7HlPNllSTapjMP8lx58ZTPcp315C5
 ztUtW9WPhMyl0RLIVvJk6zIqoNOO+NGSW/+WZI3UyS02zIwY81pU6K6tAJaYo/3VbKvL
 pORnsfQSBoa33WK3VSda1cnBeu/Mv028yj6VJX37O/UUOW/X2tT1jvmHDuhwsVsUnWo+
 sMOw==
X-Gm-Message-State: APjAAAUu+cS30MdbULSHPrfXnTBC7ZTYY0fEL/CWl3T7xt8kIGicf044
 h6xqt1xw2+4byhn/8pfrB5WKiN9qXwFTwuONNb+qWuTd
X-Google-Smtp-Source: APXvYqzOJoLhgbEnBtGZWcpRAwcnqeZGgKyD/mZT6uZACrm243D4IWBp294UmAlIEyvn30cAJVsRWtWVttZUd8rlKTQ=
X-Received: by 2002:a5d:46cf:: with SMTP id g15mr133794427wrs.93.1564517109242; 
 Tue, 30 Jul 2019 13:05:09 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 30 Jul 2019 23:04:58 +0300
Message-ID: <CAEnQRZBPnmg6c762+CjXBmsW8=aVfL9iJJgV_7VRjgaNMf-Srw@mail.gmail.com>
To: Linux-ALSA <alsa-devel@alsa-project.org>,
 sound-open-firmware@alsa-project.org
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>
Subject: [alsa-devel] Audio miniconf + sof meeting at ELCE, Lyon
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

Hi Mark, Pierre, Liam, Ranjani,

Will you be in Lyon for ELCE this year? I'm very interested in participating
to an (eventual) audio miniconf meeting. Maybe we can also do a separate
SOF meeting if they are enough people interested.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
