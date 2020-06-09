Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 438381F3681
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 10:54:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA1CF169F;
	Tue,  9 Jun 2020 10:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA1CF169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591692864;
	bh=khvEXW4P7Y48nakCrpdKcRPJH/NVVAxp8w2B5QmSPi4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rEA7O9ltaAqoKDlwDp8KY0YPf//I/HGw+B/BvWiuD3FpjUmg1OllXzHxOrlYvd6Lf
	 vpdnSVbHQcngZ/ib1oOKW7UCw8IvwQSivX9SKWgVBMhlGRE67B+/0aAaW0YBwYg+RH
	 AQz1si2h91J/mIgQ9w2u24rqsvRCp0kVdEkNuwlM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7D44F802E7;
	Tue,  9 Jun 2020 10:50:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E33CF802EA; Tue,  9 Jun 2020 10:50:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B2EFF802E2
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 10:50:50 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5773EA0047;
 Tue,  9 Jun 2020 10:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5773EA0047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1591692650; bh=ZVM47YeNPDaSy4YislrCBNmexVwHalBUbsmvJIKue8A=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=5F5spDnFY88y06VPHpPViiJCuGuSIfaZ1he+4okcqmguWLIqbKMCITV6iA1Ta9vO7
 0n9IFRL8C9/d9nb43oUmkdu5abTEJ6EIr+h/DUPiHuEtAhnYYF8YzvyyRr0mNF1NVK
 43barjmvdLzCJ9lhAEWdjBXwYuhq5dZOHOSqIFuw=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  9 Jun 2020 10:50:48 +0200 (CEST)
Subject: Re: [PATCH 3/3] chtrt5645: Add ASUSTeKCOMPUTERINC.-T101HA-1.0.conf
 symlink to chtrt5645-dmic1.conf
To: Hans de Goede <hdegoede@redhat.com>
References: <20200608202142.92894-1-hdegoede@redhat.com>
 <20200608202142.92894-3-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <e67f6c25-12b1-04fa-1f7a-c4e87c3e31ef@perex.cz>
Date: Tue, 9 Jun 2020 10:50:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608202142.92894-3-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

Dne 08. 06. 20 v 22:21 Hans de Goede napsal(a):
> The Asus T101HA uses a digital mic connected to the dmic1 pin, rather then
> the default analog mic on in2 (just like the Asus T100HA).
> 
> Add a long name symlink to chtrt5645-dmic1.conf for this, so that
> the right config is used.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   ucm2/chtrt5645/ASUSTeKCOMPUTERINC.-T101HA-1.0.conf | 1 +
>   1 file changed, 1 insertion(+)
>   create mode 120000 ucm2/chtrt5645/ASUSTeKCOMPUTERINC.-T101HA-1.0.conf
> 
> diff --git a/ucm2/chtrt5645/ASUSTeKCOMPUTERINC.-T101HA-1.0.conf b/ucm2/chtrt5645/ASUSTeKCOMPUTERINC.-T101HA-1.0.conf
> new file mode 120000
> index 0000000..b4d2816
> --- /dev/null
> +++ b/ucm2/chtrt5645/ASUSTeKCOMPUTERINC.-T101HA-1.0.conf
> @@ -0,0 +1 @@
> +chtrt5645-dmic1.conf
> \ No newline at end of file
> 

Applied to the alsa-ucm-conf repo. Thank you.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
