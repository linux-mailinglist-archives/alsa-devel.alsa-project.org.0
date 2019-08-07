Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 114AE85F3A
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 12:07:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 842531672;
	Thu,  8 Aug 2019 12:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 842531672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565258875;
	bh=SaV603Kw1u/zP0KzjOiww5msvWPT5YaIII5IlYECT1Q=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DYMES2drl6gvQ0rLtLBA4rWBgS81VjO/z0XcoR0X5CYrzkHnh31rYioyknizVM8tq
	 ija+vfg1+Q07XBJari1a2bM328xBPEjFJICgynMvXUwaxYqQnJkMj7/shyoOjJ8iN9
	 2qzuZkO+CWpmMkhR/XEQVCfwGTn6zM4hYMjYb20g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDBCDF80535;
	Thu,  8 Aug 2019 12:06:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 592CCF80290; Wed,  7 Aug 2019 19:30:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE, 
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C21BF800F4
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 19:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C21BF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RUMfxBS/"
Received: by mail-ot1-x32e.google.com with SMTP id l15so50226802oth.7
 for <alsa-devel@alsa-project.org>; Wed, 07 Aug 2019 10:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=71kOgONz1Ufg5VPmWh410pK9Snv2NRM0u3CtFeAvTOg=;
 b=RUMfxBS/wTzHZ6DwgV0xZKTVTwdU/q07HSq1YJry4o9LZGl3KyUOIHK1ASMoeJp9Mi
 NOH/Vp8hLj9Xwb7F4f/8jfKMsa0ebAEjnwo89Pt6uzwrIh7bTZHXm/8vWC43ZXzTJaAu
 bjev2tqAfnHI+v8IbA5IxV2mePEfdt0cahilLKQigsEptPcuEIwahONRE6PG1CzENOff
 i/kzie848anDje+/7J4q7HRPEfHouqwZOrJJ+IGUhSfA/0aXcSiRpVzNwe/uwBt02cwA
 RNQJU597T5xbiAjd+kCaLtJXwt57GD3I/+sRuTw7zPS2TjNkXu4q9C1NkeiEsiUNyQAf
 snEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=71kOgONz1Ufg5VPmWh410pK9Snv2NRM0u3CtFeAvTOg=;
 b=jMe+ngDIghUbEUloZTlcVorRVUr9kdJA73PsCiuQilmKlozEFCc2SSkcIgVMoneaws
 Uf9W1pCnxJ1Kx43Ouz5S+d2c/8UWkQq1QzjRzbB8eAX6mlcLT76B2rKOQ3oSle2WcRY9
 BuqyllNBh2JdwqmOym09EUYsol/563U3qs9kg1Fv50F/Nxko9KGkgWnY0ASwW8m2hbjV
 SWUxadZbYR5z8tleWakrAYJ3MXaH+1UJ/sJDIvC7oTCtCuQuBqCYaIBzm6TTDj512PGx
 SHxuiyWbhJQ1RssPMHbzvtnWDqnsDPf4x37dHCccboAe/xGUZh3UWquYtHQJKhct3DKE
 7WRA==
X-Gm-Message-State: APjAAAU0dWXQC5PvwQDmWbnZTNUs5TJr98vlYjmqost/mctOrZ549BCq
 V5/s0eGWfQP4O/zL2FjcW+XWA2PTVBZtKJw41q8x6WND
X-Google-Smtp-Source: APXvYqz7mboNDsWLKU0ibnh6/GdAIehB62KHjLqK+Cg7bZdth755GdImNx5sE4atJcRin0lEhNBbFDtEYdEo7Km1+Rs=
X-Received: by 2002:a02:3093:: with SMTP id
 q141mr11355894jaq.128.1565199043639; 
 Wed, 07 Aug 2019 10:30:43 -0700 (PDT)
MIME-Version: 1.0
From: thomas rost <thomasrost@gmail.com>
Date: Wed, 7 Aug 2019 19:30:32 +0200
Message-ID: <CAJ_PRtDf4+-ce_D+=ec36Kv4=m_NT2L5shmownNBi_HgbR0aCg@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Thu, 08 Aug 2019 12:06:09 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] motu microbook iic
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

Hello,

can anybody help me get the 'class compliant' motu microbook iic to run?

this is my alsa-info.sh output:

http://alsa-project.org/db/?f=0fd9a8df7bae3400d83b6af8b75c45aa0760d84d

thanks in advance.

thomas
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
