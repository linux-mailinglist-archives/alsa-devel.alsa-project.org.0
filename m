Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9B66164D0
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 15:18:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49C4F1685;
	Wed,  2 Nov 2022 15:17:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49C4F1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667398704;
	bh=AOMR9SnvQO4J3D72dWab1TiiI3Z0ctfdEIh0iyOPyWg=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=X79bqXFLFDVfS8jH9klwNmRWObUWDayLew/AvsPYRvNvCE6knjn7/g0kUhtZLzLby
	 CfpnvbZKsh4VJhcygQb5xsPQAqDxAPLAbLhId8hwgccKBTDaN6Et3vjI1fRZbBKCcu
	 shukR8M4mzUedcNPI0eFk3deuroEQB7AfC3e3Ris=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B92F3F80423;
	Wed,  2 Nov 2022 15:17:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A765DF80163; Tue,  1 Nov 2022 02:04:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F291BF800CC
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 02:04:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F291BF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ddFOCcQ+"
Received: by mail-pg1-x534.google.com with SMTP id b5so12149435pgb.6
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 18:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mmEW8219CJ1DYDPVFVBcNXYdO5oEHDNeBQ0+FkOQP/8=;
 b=ddFOCcQ+43QbuHyQYOYbbR99Sq2I2v/Zfw7B+QpWGD5hXsD/10vIQuBAmy7X0ln4XJ
 27xxSE35d+9r4CTNkFrvEWaUZVTRpMcx9/4qQGWL4ywAh/3oB1mDvPbdpKkZy/3Z6MUG
 eg883NaFIEwAihUrFtBB13hC52yySWFfluqktJL7ca/fbnRTkfRBvIaf/+JseR6AJr97
 o7DMxsfn5Cf+opSLXXiFetpRWpUdsfXgM9L8LAb2oiAsAc3t4q7dySWfOAwC/2oOBn74
 XtkeXkxP048qfukWyJzjR3Q/ZqsgRDy2Oc/MYKc6wXhye77qF83gme8KC2MPoe0vEy19
 MDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mmEW8219CJ1DYDPVFVBcNXYdO5oEHDNeBQ0+FkOQP/8=;
 b=ej29MB9cnQ/PzRsgpXGTdV9f7ouvqQyTKXnjj2GjOFaA799Yan2wS1mgD2pUu5EGXw
 77cSqg71WkEmaxIbFp8lLxOaGGvBo1x5NlQVpadLOMx4MyRPvwBmEGZZDd1ql4cmd3BC
 N7qSA8rvlSS1YZDYGCMxaLDNQIm4INckX42oKhbRlyn7VUmy5qO5jBVPz646kRBFVHJk
 NjasFAJJFSWk855D8D6ytzE8vEdYLYP7IcswQwvfl96p/dMLAm/rhyKpcblu7SQoLF47
 MiYhy4zizJia4XOAS7hjj+Jy3o5h7xliEX65tfC4fnyZa71TnmT11TKlC73oKPWPXz/0
 Q9Bg==
X-Gm-Message-State: ACrzQf09avX1yc5FcyaEb3e3L1a8hAS5M0mW/12QRKPoFucINLvyVlFC
 LaC8Ij154+cTSNUb4ky5qtHByZnq6zXm7IvJaAI85rtQz3Q=
X-Google-Smtp-Source: AMsMyM5HSSJXXfiXMPti6vb8a2FkFNP/ITbtl3ykprdmkHfINHAcJy4ZHyeSaeb6YvHYnEs7DYcUVNEOx3MszgfgCCE=
X-Received: by 2002:a05:6a00:1a04:b0:52a:d4dc:5653 with SMTP id
 g4-20020a056a001a0400b0052ad4dc5653mr17321470pfv.69.1667264677513; Mon, 31
 Oct 2022 18:04:37 -0700 (PDT)
MIME-Version: 1.0
From: David Jaffe <davidajaffe@gmail.com>
Date: Mon, 31 Oct 2022 18:04:26 -0700
Message-ID: <CAG74igXPJjnQF6-nbXn2bXywWA0cKpR3cDhYPwg=fKN6J_yZZA@mail.gmail.com>
Subject: building aplay / arecord
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Wed, 02 Nov 2022 15:17:26 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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
Reply-To: davidajaffe@gmail.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Newbie question...

I downloaded the alsa-utils source and it says to run ./configure.  But no
such file exists.  And if I go to aplay and type =E2=80=9Cmake aplay=E2=80=
=9D it can=E2=80=99t find
a file called =E2=80=9Caconfig.h=E2=80=9D, which is presumably written by
./configure.  What am I missing?
