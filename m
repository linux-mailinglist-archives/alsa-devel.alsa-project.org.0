Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7028CAB7F65
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 09:55:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4147D6197F;
	Thu, 15 May 2025 09:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4147D6197F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747294073;
	bh=DsjDnHtiCgBweWj2Z9rRF9NFYYy/5gSoExnp430J+Js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BFZ+LMv3UTn1xy0E5x8+lZX12257eEi4zYbSkdTwIUTI3z/p6U4FKLDdZe3l1D2J4
	 B3Mz1G91mUEsSS8qeJnUChI/RhmVCUM9ZK8wWTVhEW8r2CN5ncJqZxKsYpXsjS8Qqb
	 utL8KSip4UiIc5NzokzdYYiSwlqEmXNCJxYqs+Bc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EDD5F89722; Sun, 11 May 2025 16:32:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FA60F89723;
	Sun, 11 May 2025 16:32:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 787F3F8E917; Fri, 25 Apr 2025 11:08:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13954F8E4EF
	for <alsa-devel@alsa-project.org>; Fri, 25 Apr 2025 11:08:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13954F8E4EF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=R37HHpOU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 53P8TINr015915
	for <alsa-devel@alsa-project.org>; Fri, 25 Apr 2025 09:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E7YGT9JoWm91VFNYG/u4ZzAL
	7c7lgU5OKZbu1IKjJ28=; b=R37HHpOUIk4ozHJYiR/Vf6YEkpL6IJnwmqdF+5D/
	Efzded7xua0q/u+CyTp9Zv6jKWBABfo7lgKiFApdm9UcbKC4jIf1amT0KxH3bbLZ
	FLWfEcCHT3wCUpHOqxSJ7752t7yf0yAv6XvetfRfvEKikA3uUX1Yx5HM8+azt9hW
	YQv78cpdaniUK/Bln8YCUxYmNVgQ0UJOsyyrXtNUb3FO/+vSAjCe90T2z5pPzFea
	mU1OG55KJ7uNj0zotoSiZhxPf0x/2Mj4APd9uY+bzL8UGZlotVbymTdvZ8o4b9Db
	zxKz2YpdNGirhCI/apCdUe3tRMWdP2hG2BDSbijWsWmAPg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3ge1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <alsa-devel@alsa-project.org>; Fri, 25 Apr 2025 09:08:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c54a6b0c70so200458785a.0
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Apr 2025 02:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572079; x=1746176879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7YGT9JoWm91VFNYG/u4ZzAL7c7lgU5OKZbu1IKjJ28=;
        b=hdR4c9UHuT+8bO/XvfR6hc2E71dce1+BFiH9agjtYfF2/jzXlte7tFOnIWyUKkjwOZ
         jQosXwiky/NXTvqFxwOMBl4dB+WejE+H9GtHXWkc+RVrrqS/TzOAtQzsPkTKuz+AJZeD
         eTPa9rajhAbF8WQQaCHuB2baa428o8QOhph0dQyV7o0UeTILaFPEKOejn7dTGMb2bLwH
         Jqm620ht9MBNi9qD6bl/Bhg1zHIWpXP9jzkawrx+adpIB3s6/RoJErPZF6plbKSGW6Cn
         H/VF2koWLOH7T+rm3phdMHMPA7QrO+43ZJ4kZ+EmLni1UoWUmGutasg0unmJezMbyzeV
         FCcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCo/2Aiiu/iPYdd8feKLB0q9R8I8pJoQ/s3iJu9H8i+gsbMWF/7A8L6RejymdA+vm1SU1a+F8P/Lc+@alsa-project.org
X-Gm-Message-State: AOJu0YyyyXK8IjrqAJ/CsJMNTSLd9WzCIzkYQ9ncZKFoWzFv6FonbnKV
	VQEl/QNy+Wf41PTNgVAXEz2hd7QK+r4I/kVnWDQK/VDhYCYgxNzKg+3fDOyxiyzerubD7hqlR4g
	8XBQMRapFqVUADdvjjW3sg7hHCkj7FGqrQqnDBYefr2J/E7LFAJZSPycmEiIAwA==
X-Gm-Gg: ASbGncv47c5l+lIFDLwrPxj/zUpu/rv12dIcvg76l25vETq+J+FyA8Ao90WZcXJ33Nz
	GJrfjAO4P6FebCANtxiiZsJTihyOlvCTa9r3iwRWoLmFTc8rrBxe8d7V78Urp+09QPL59TBt+2f
	ddtfRHxRrMS76SfgKPzVCJaZCYglWUrKIjeP3k1rOx+FJ19EBZMATFeXr/3TLhwGQGPmdPNfr/L
	CqsiLbzBqll55r5EimL0zamqOwPWslHWJpsFly8eED+sdqZL2Z4ys/H4TN4/t0rAVoalY/5kbCT
	1xC4dt7SatEmkf44gU8h6fqL780OibRF/aCGxBuFVwPr71sv7bJwJ60ktrf+jGRhh33dEfJXKCo
	=
X-Received: by 2002:a05:620a:1b99:b0:7c5:a463:397b with SMTP id
 af79cd13be357-7c9606e0b7dmr246313885a.20.1745572078826;
        Fri, 25 Apr 2025 02:07:58 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IFHpqKgmY/joCABcKakjj51b/bf9LSO5bp8KVEFf7NSYBd5yr5G0Dj8JO9ClMIekjeU5G8jvg==
X-Received: by 2002:a05:620a:1b99:b0:7c5:a463:397b with SMTP id
 af79cd13be357-7c9606e0b7dmr246308285a.20.1745572078331;
        Fri, 25 Apr 2025 02:07:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb83dasm520591e87.249.2025.04.25.02.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:07:57 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:07:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
Message-ID: <cgog34zs3e43n23mkt35swvu2ibuoaav4ccrhjoizg6b4kgc63@36blexv25aud>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
 <20250425-fp5-dp-sound-v3-3-7cb45180091b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-fp5-dp-sound-v3-3-7cb45180091b@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2NiBTYWx0ZWRfX2J1DhXgcUxOx
 9R14tE8mwZPyH/q+tsx1vgdGzwGj3uFmZJHP1yGLUTiCMnA86tj1OIPKB7dllPLj/1ociHm6+6C
 b/CeM7ySJOmFJYWhA74MldE/MwHsslTr/KygfITGGRFGC6OTfaDBGn3hjGKf8SqtGxTvWHpl8WH
 n9Nbh4NTDyIvwXbWsXRT9p+98Bej8PWCX+k0lLKCrGIw6pfSvbRzXDdlTqxefnmao0MPtMe0YkR
 3tbGGHpYkuRO/dS2ZW0WrbBsHg0dkeuOONnhggUMxoOuEph6F6JX+71Zhc0NPUq3lqqn7kCXZlU
 SZQJy8WsFRUtaOEtiKTXzUo4xeECK8rrvEyWFIB3av4EM2m39dLvyaGkziMN6pmZLA/yLi1MbXQ
 lxIk360/xmTsLk5msNGELnf6Bjl1qn+Dv6xdvsUxWv+tzcXFzdx5dmDHQh0oFcD9cFFuEAgn
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680b50f0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=EBsx7UlYEkoSbB8InyQA:9
 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 8Bpv-TAoRgDZb-H_PGRxNG-rIodMgvRg
X-Proofpoint-GUID: 8Bpv-TAoRgDZb-H_PGRxNG-rIodMgvRg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=908 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250066
X-MailFrom: dmitry.baryshkov@oss.qualcomm.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3GTO7DPSJHSK6PU7JY2USBYIPLISDDFH
X-Message-ID-Hash: 3GTO7DPSJHSK6PU7JY2USBYIPLISDDFH
X-Mailman-Approved-At: Sun, 11 May 2025 14:32:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3GTO7DPSJHSK6PU7JY2USBYIPLISDDFH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 25, 2025 at 10:07:27AM +0200, Luca Weiss wrote:
> Add support for DisplayPort Jack events, so that user space can
> configure the audio routing correctly.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/qcom/sm8250.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
