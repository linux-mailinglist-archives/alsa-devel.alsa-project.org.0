Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7D5DBFF6
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 10:32:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 128141654;
	Fri, 18 Oct 2019 10:31:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 128141654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571387527;
	bh=YbXpK3qYjyqs6+34PD79ygjSZMZcit5Pb+FpRYX/HJ4=;
	h=From:In-Reply-To:Date:References:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rfshBgmdog8qI+LIKfKihoPfPl6JwUNwZf306Qcr6jx0UnWp13nulsCo/APr/Se/X
	 zbIYvmkcRgzFUG8pg1RN0Yyjtgg6/X9Vg1S5i/E3A30H3DMiX2bftr5uYxSczLXuPZ
	 vF39eXzVQfqrcS3sXKHhNaRr5UzH2GF4WavF2CKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ADF8F800F3;
	Fri, 18 Oct 2019 10:30:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FB7EF80362; Fri, 18 Oct 2019 10:30:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F010EF800D0
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 10:30:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F010EF800D0
Received: from mail-pl1-f200.google.com ([209.85.214.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1iLNeK-0004MN-6l
 for alsa-devel@alsa-project.org; Fri, 18 Oct 2019 08:30:16 +0000
Received: by mail-pl1-f200.google.com with SMTP id g7so3299412plo.5
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 01:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=9HnLyuAc2KszW2sCbnW2TVqDttn2ZhGYOZuSbcGb+Ao=;
 b=KspbnqP8CuuKSEqFqB6vDGB26LZZvaYLk1McON+xhGJfv5bSh7IIcelH3g5W/KMZuw
 ETcTbPpJHLOpwxXORjRQTyPXS+OHhq04A9JmFH0CVfJnl1VUasMAvAO856KOA/rv0Tsd
 gVqaqnlDvzL/uQsIS/H2dwM3qPNolz+2oIEL7Czr9MMMpTLs0W2CK90TNzYRslab1pZH
 6q13hVvGiNIt06/vjtY+RAxcbtflh2WMjx9zKjaVgtDhCnYRkUGEdnax4MfX5H3dggqI
 mwrP0YNb979/S2w385qjCVfnSWRE96H2sV94Ou817UvcFGfhGsQI1fVcWS1owhsBe///
 dwoQ==
X-Gm-Message-State: APjAAAWkn7X5ZTcPuXkuY9i90IOa+H/15qoLrmCnJPNMQA1xI+adZFXi
 RQmgKx7Zqf/emqcvCUBnRala2Y9ys2THQmNPxyXR/daBbTZypDTJYeq0EcNSjx6CMyIDiNkwcaO
 IM6g6BuOSHd87ROBsyEQdWxKdkKXfacxwvEVFb3XG
X-Received: by 2002:a17:902:aa86:: with SMTP id
 d6mr8878185plr.268.1571387414555; 
 Fri, 18 Oct 2019 01:30:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx/HstgLPTWdbdqHW8QWIvwRL6LLMXn5En0TaPY+gU76l2aPXRwvWmgbm5PxCa/kgGW3UqDQg==
X-Received: by 2002:a17:902:aa86:: with SMTP id
 d6mr8878156plr.268.1571387414189; 
 Fri, 18 Oct 2019 01:30:14 -0700 (PDT)
Received: from 2001-b011-380f-3c42-80b6-0157-ba58-fc96.dynamic-ip6.hinet.net
 (2001-b011-380f-3c42-80b6-0157-ba58-fc96.dynamic-ip6.hinet.net.
 [2001:b011:380f:3c42:80b6:157:ba58:fc96])
 by smtp.gmail.com with ESMTPSA id f185sm6882160pfb.183.2019.10.18.01.30.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Oct 2019 01:30:13 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601\))
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5hr23ah3g9.wl-tiwai@suse.de>
Date: Fri, 18 Oct 2019 16:30:11 +0800
Message-Id: <4C18DF4A-FAE8-4762-AF65-F892A4845297@canonical.com>
References: <20191018073848.14590-1-kai.heng.feng@canonical.com>
 <s5hr23ah3g9.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3601)
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v6 1/2] PCI: Add a helper to check Power
 Resource Requirements _PR3 existence
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



> On Oct 18, 2019, at 16:18, Takashi Iwai <tiwai@suse.de> wrote:
> 
> On Fri, 18 Oct 2019 09:38:47 +0200,
> Kai-Heng Feng wrote:
>> 
>> A driver may want to know the existence of _PR3, to choose different
>> runtime suspend behavior. A user will be add in next patch.
>> 
>> This is mostly the same as nouveau_pr3_present().
>> 
>> Reported-by: kbuild test robot <lkp@intel.com>
> 
> It's confusing -- this particular change isn't reported by the test
> bot, but only about the lack of the CONFIG_ACPI ifdef.

Hmm, because the test bot asked to add the tag.
If it's not appropriate will you drop it? I can also send a v7.

Kai-Heng

> 
> 
> thanks,
> 
> Takashi
> 
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> ---
>> v6:
>> - Only define the function when CONFIG_ACPI is set.
>> v5:
>> - Add wording suggestion from Bjorn.
>> v4:
>> - Let caller to find its upstream port device.
>> 
>> drivers/pci/pci.c   | 18 ++++++++++++++++++
>> include/linux/pci.h |  2 ++
>> 2 files changed, 20 insertions(+)
>> 
>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>> index e7982af9a5d8..1df99d9e350e 100644
>> --- a/drivers/pci/pci.c
>> +++ b/drivers/pci/pci.c
>> @@ -5856,6 +5856,24 @@ int pci_set_vga_state(struct pci_dev *dev, bool decode,
>> 	return 0;
>> }
>> 
>> +#ifdef CONFIG_ACPI
>> +bool pci_pr3_present(struct pci_dev *pdev)
>> +{
>> +	struct acpi_device *adev;
>> +
>> +	if (acpi_disabled)
>> +		return false;
>> +
>> +	adev = ACPI_COMPANION(&pdev->dev);
>> +	if (!adev)
>> +		return false;
>> +
>> +	return adev->power.flags.power_resources &&
>> +		acpi_has_method(adev->handle, "_PR3");
>> +}
>> +EXPORT_SYMBOL_GPL(pci_pr3_present);
>> +#endif
>> +
>> /**
>>  * pci_add_dma_alias - Add a DMA devfn alias for a device
>>  * @dev: the PCI device for which alias is added
>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>> index f9088c89a534..1d15c5d49cdd 100644
>> --- a/include/linux/pci.h
>> +++ b/include/linux/pci.h
>> @@ -2310,9 +2310,11 @@ struct irq_domain *pci_host_bridge_acpi_msi_domain(struct pci_bus *bus);
>> 
>> void
>> pci_msi_register_fwnode_provider(struct fwnode_handle *(*fn)(struct device *));
>> +bool pci_pr3_present(struct pci_dev *pdev);
>> #else
>> static inline struct irq_domain *
>> pci_host_bridge_acpi_msi_domain(struct pci_bus *bus) { return NULL; }
>> +static bool pci_pr3_present(struct pci_dev *pdev) { return false; }
>> #endif
>> 
>> #ifdef CONFIG_EEH
>> -- 
>> 2.17.1
>> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
