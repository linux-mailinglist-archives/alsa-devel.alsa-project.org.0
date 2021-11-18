Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 212AF45898E
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Nov 2021 08:03:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 577011693;
	Mon, 22 Nov 2021 08:02:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 577011693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637564590;
	bh=EfUXEEINLQszA870ynwuSZ2Lf08STwo891yLHWgYUFU=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TFQUMNeMpORjST65xIqxFO9qaMHXsift1Y0DPKsTBiOQREnQjrA4cRzqzuL5xkrdE
	 9vv7NkGSI371lPcJFlUXDbdAapYPj+epeWVo+sKCIcJ8R4jIWqLidH8OZvtg/NyfI+
	 Z+SvKCo7X/XbeH0iYT+m8rcKTg+3o4x3zKRKbw5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BED95F80245;
	Mon, 22 Nov 2021 08:01:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5DEEF80272; Thu, 18 Nov 2021 21:33:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3C6DF8010B
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 21:33:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3C6DF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZLNhm57p"
Received: by mail-wr1-x435.google.com with SMTP id d24so14000479wra.0
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 12:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=EfUXEEINLQszA870ynwuSZ2Lf08STwo891yLHWgYUFU=;
 b=ZLNhm57pDYSN7nVaLatlLr2zlOUpHpXpfKGPhdjPkkzON7XqldHyxk+N5KmsfbJEqZ
 SGhXVXn5maQFYFQwNk+A0c5r3jh10fvLtq9k91rIhBQAvKUKd0TXb/MwlTZLlVSs5UF/
 rDqOqIVlmrkiKxj+910yklIJtBmd/mG//3xVGDv6CtnSWyg/gqbdrRSxnN+Izq9Z2v3b
 SXrf3aizAvESZGW2n1P8+RZ7TVFTdWU4Zg+6nU/ZEBlf/qfrt9fQ8R3FkYwe1HjhW3Fq
 wtVYlAtA4nS45/6nz1S7z3lczlqVqWqtzTu1/RozFlYWlgPFYpSU0kvVmxq3qJIe9wWD
 vKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=EfUXEEINLQszA870ynwuSZ2Lf08STwo891yLHWgYUFU=;
 b=UBLjQHPYnDDqI8ffN30UHYX/wElbSkj3YUBk6wgGLDN7BWtjGooOwc+MC7Q4URh3d0
 nI6DB/z0noLJM3kZqm4P2CFQQDyN07Ho5LjzSpDF40ZQ8OERMZTTfCkTApiJxqonz0Hw
 rJBjUT3qw0i+aDdVB4SZbCFyjThaf9TZ3H8eDJxhoVfdhePa/JmNmZt7xy7nowrf9w1A
 GBLtrc8Nb8yI8k3xYx8rTU3H9WQWkyfwARFPAhB+XORzgQKK5R6O5eKLHOEcl7+0u27H
 R6g7Kv2bGGB66GfFH3YVoJOB+Y9iKabDE19RiaLtRRbRgIZO94iB7Eq+b1K0fBM6slGC
 TfdQ==
X-Gm-Message-State: AOAM5332K+kuH+XjYwEXixdcNjVnC+N78nifL8VSqIUjouYHk+Pd8WRF
 Nb5yc/ccO/VTcLwRcZM2nR9L0Hf+K0Q=
X-Google-Smtp-Source: ABdhPJx1RGAefCdS9K6lVb3q1I66YXizjFffTzMiRHrhdzWFAr+JOb+sV3Bz6gJSA5IU0+MMTrI9OA==
X-Received: by 2002:adf:ce08:: with SMTP id p8mr390887wrn.154.1637267620349;
 Thu, 18 Nov 2021 12:33:40 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:fc8d:4de8:c1d1:9213?
 (p200300ea8f1a0f00fc8d4de8c1d19213.dip0.t-ipconnect.de.
 [2003:ea:8f1a:f00:fc8d:4de8:c1d1:9213])
 by smtp.googlemail.com with ESMTPSA id o12sm858270wmq.12.2021.11.18.12.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 12:33:39 -0800 (PST)
Message-ID: <d9d76980-966a-e031-70d1-3254ba5be5eb@gmail.com>
Date: Thu, 18 Nov 2021 21:33:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Warning due to "ALSA: hda: intel: More comprehensive PM runtime setup
 for controller driver"
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 22 Nov 2021 08:01:48 +0100
Cc: alsa-devel@alsa-project.org, Linux PM <linux-pm@vger.kernel.org>
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

I get the following warning caused by 4f66a9ef37d3 ("ALSA: hda: intel: More
comprehensive PM runtime setup for controller driver"):

snd_hda_intel 0000:00:1f.3: Unbalanced pm_runtime_enable!

Not sure how this patch was tested because the warning is obvious.
The patch doesn't consider what the PCI sub-system does with regard to
RPM. Have a look at pci_pm_init().

I'd understand to add the call to pm_runtime_dont_use_autosuspend(),
but for all other added calls I see no justification.

If being unsure about when to use which RPM call best involve
linux-pm@vger.kernel.org.
