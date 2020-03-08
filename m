Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A57B917D0D2
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Mar 2020 02:46:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF7F51661;
	Sun,  8 Mar 2020 02:45:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF7F51661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583632009;
	bh=sJRoIC4dUn8KlgrP0Ts1zm4uzi3g4mjtIrT1nbohUNs=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GW9jBVAVh0jLnnsuDZJMDPZpm6eCKSeu+dmYfoUkXYAKYYbpVInDCge1UwX7fr/dI
	 1bJEeYgbkPuEGbqUxQo6sgk2grBoHcT6pIWqaORmS3N3XfN+aXybwYhOWsvDrp9X3S
	 /nrsLtmgZrDJG/ouiQ7ytvNT1VX1ABWWv9WW7qv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE31FF80130;
	Sun,  8 Mar 2020 02:45:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED89FF8025F; Sun,  8 Mar 2020 02:45:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5401FF80125
 for <alsa-devel@alsa-project.org>; Sun,  8 Mar 2020 02:45:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5401FF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ho5yhnOA"
Received: by mail-wr1-x42f.google.com with SMTP id n7so6733063wrt.11
 for <alsa-devel@alsa-project.org>; Sat, 07 Mar 2020 17:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=5seyPI0atZMTkT3cGaOE+WtwxarPGLWaUiXJJBS++nk=;
 b=Ho5yhnOAl3v4i5Ld4PfNrBAL9wuYiWtvvly/znRlzMnJbO3r31l0gEzLq+ei7DNJ4W
 22orlRKfhk+GTzOYaJbniftbirzrl4an3LmasBku/sfZ5RYUTPxlkqpWX24EGYmDjO9x
 i6lMpl+mMCnHdZiIzsU/QVDxreFv9xYXqVJEOBB5WTcir2x1zcTEbfNNgGX5wTZjiKo2
 74lfPT3fc3tUfyU8x1Sda6qVWdsnBc7BxJNHGQ+Sapq3Os4wT01r3B8UIolLHaJ1V4RE
 EfC8Iu5ZY40k8sXuKOtu/Tp9YVjFofpCAaCAm1vnBr2LhjeSP4CoVc8QAnKqpdd0duv1
 73uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=5seyPI0atZMTkT3cGaOE+WtwxarPGLWaUiXJJBS++nk=;
 b=BDDmSEDVzW8risH9WCZIxK3URqD234RWceQDvQ6wXubmp5EKHFe4PIwRU6ZvEpCvaR
 lyk8NTSp3hfkUBC8BdipR6ywcDfCgnmYySCR5q+3Eu6XpVztRYWEhv/PZa8FkO8CJcWp
 Edu37sS9KkQ1n/29oJ8IRcvrF66JUTzx8Vm39TjOmnnswWv+vGn2Uwf0IfuBOtL7dOMT
 dXD3PZfVH2zxaCjePbGFDLt3ZnWuDRrxYVBn76VMYj9olQWUYgQwiE0p/rnq9Th9O4wk
 UC7jdtfasku9KoFWDu4aUMGQZcQvLvUqe2yHHMRE/t6DTzJfsRDY/T1HcfX8wp/PM7Mi
 cypA==
X-Gm-Message-State: ANhLgQ1ph4vIdT3r1FwI3QsAZmuM6tJX/i8mw5cEF5GE6GsbVyMW8JQT
 nqQLgoi0qlUp1mOYu+wWF96FZIVS
X-Google-Smtp-Source: ADFU+vvFq4nXj+Udq339U/5u69875D88O9hZzv4lcbefjkwVXTo1XVsN+yISytlMMZNWdVwOp2o8TQ==
X-Received: by 2002:a5d:6a8d:: with SMTP id s13mr9063754wru.260.1583631900306; 
 Sat, 07 Mar 2020 17:45:00 -0800 (PST)
Received: from [10.10.10.102] (adijon-656-1-26-152.w90-13.abo.wanadoo.fr.
 [90.13.161.152])
 by smtp.gmail.com with ESMTPSA id n1sm9373202wrj.77.2020.03.07.17.44.59
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 07 Mar 2020 17:44:59 -0800 (PST)
To: alsa-devel@alsa-project.org
From: Olivier SCHMITT <sc.olivier@gmail.com>
Subject: alsa-utils compilation error checking for snd_tplg_new in
 -latopology... no,configure: error: No linkable libatopology was found.
Message-ID: <a7133f96-6252-df8b-9a50-199cf660131c@gmail.com>
Date: Sun, 8 Mar 2020 02:44:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr
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

Hello dear dev team members,

I just try to compile all for my ubuntu 18.04 to run more than 32 loopback.

I have found something about to :

-compile kernel with kconfig CONFIG_SND_MAX_CARDS=256
-compile alsa-drivers, alsa-lib, alsa-utils with gitcompile 
--with-max-cards=256

but when i try to compile alsa-utils i get:

checking for dlopen in -ldl... yes
checking for ALSA LDFLAGS...  -lasound -lm -ldl -lpthread
checking required libasound headers version... 1.0.27
checking for libasound headers version >= 1.0.27 (1.0.27)... found.
checking for libatopology (sound headers version > 1.1.9)... yes
checking for snd_ctl_open in -lasound... yes
checking for snd_tplg_new in -latopology... no
configure: error: No linkable libatopology was found.

Can you help me? I dont found anything about this error on the web...
