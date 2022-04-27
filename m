Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B42151181D
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 15:09:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA9CD1779;
	Wed, 27 Apr 2022 15:08:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA9CD1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651064964;
	bh=AVgP5sM7eaFvnDVIO+OaEUNsbIvjlUYUt48Iu9fv9s8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SIumYIpVAX5no+pd4RYkBfwZevidcPROkcTfmKSo4Jz7EpBWCobR01xQgYRg4Vcef
	 q/JmtU5sDA8cZZBLp8SLRmeCCcVP3MkX3Pe8QUvjmWwzqER8M3ikAD4fmu9XmEKOcd
	 P0yNXOB4Jp3bbouFM9cnnIOhRJuXbDsn/q6oiwh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1753EF800AE;
	Wed, 27 Apr 2022 15:08:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61235F8016E; Wed, 27 Apr 2022 15:08:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46157F80152
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 15:08:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46157F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="mBQZGTxM"
Received: by mail-pl1-x630.google.com with SMTP id u9so880337plf.6
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 06:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2JPjHAeZq090jgOPsSv7dWrFIEdMt7js8+PDgdk+ghU=;
 b=mBQZGTxMrs6EPw2DkWEQTttndTqU1SBJ9DseVtY9ET2+ZsK5ByZxNWJENx5rNVJKS0
 dNNMbYKNoYLP5/NFaRuZlyFEk7EuCZghv4JkRNJa4LkO6TXB7ghId/QQ24aFxL3C+O/w
 pSErZzrKlW2AmICzH9a1jJ5YipCI8Gyqz+gOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2JPjHAeZq090jgOPsSv7dWrFIEdMt7js8+PDgdk+ghU=;
 b=dVYlF0dZqBVZ3qH7faUPUCHU2+lIgoQHvbPDgglYCq0oaw3g0NCt30wso6VM5MS0hA
 Z+lZZJevPGgWDkt6cLlN7AESsqIYTj7nW9Fc2NrHJRjsVXm0edzG7GvrwZqscITMg1t1
 aeGlIoeuQnAOriVjWMWZFCferO6Mht0cn7RVNK8NE0hjF2n+k4LEVM0mxfVGcOA4LON1
 8mmzt8TG4RKOwzHKXd4TEjNE5p2W8emDiJ5lIFTXfIMizYe7Dc2WBc9HPF2u9+N2pkgy
 n+ZlckqCG6ORhWD1yhiTqc73QdBkNpV7P6nBSCpK8JuLCYNdCIopU9hAhS99LjEHLKY6
 rgpg==
X-Gm-Message-State: AOAM531KDooGzY5kYWvH36F/4HcLMgmRb8Ua0M4y7FAagE3pJhSE58Zc
 AnBt9+JrUy711Y/Dx+nVGO2t+A==
X-Google-Smtp-Source: ABdhPJzpk9ayUkXxUU0veZg/byJ6T848MVayuQeABnpDH1tHUstGQn5iJnAzTxsZPFZscQWDjQrtdQ==
X-Received: by 2002:a17:90b:1e4d:b0:1d2:a91e:24cc with SMTP id
 pi13-20020a17090b1e4d00b001d2a91e24ccmr32832033pjb.99.1651064895880; 
 Wed, 27 Apr 2022 06:08:15 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8e2d:263:26e7:c039])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a17090ac24600b001d9738fdf2asm6890099pjx.37.2022.04.27.06.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 06:08:14 -0700 (PDT)
Date: Wed, 27 Apr 2022 22:08:10 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v3] ASoC: SOF: ipc3-topology: Correct get_control_data
 for non bytes payload
Message-ID: <YmlAOm7AlZGpQLPS@google.com>
References: <20220427124025.14615-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427124025.14615-1-peter.ujfalusi@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, cujomalainey@google.com,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com,
 senozhatsky@chromium.org, broonie@kernel.org
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

On (22/04/27 15:40), Peter Ujfalusi wrote:
> It is possible to craft a topology where sof_get_control_data() would do
> out of bounds access because it expects that it is only called when the
> payload is bytes type.
> Confusingly it also handles other types of controls, but the payload
> parsing implementation is only valid for bytes.
> 
> Fix the code to count the non bytes controls and instead of storing a
> pointer to sof_abi_hdr in sof_widget_data (which is only valid for bytes),
> store the pointer to the data itself and add a new member to save the size
> of the data.
> 
> In case of non bytes controls we store the pointer to the chanv itself,
> which is just an array of values at the end.
> 
> In case of bytes control, drop the wrong cdata->data (wdata[i].pdata) check
> against NULL since it is incorrect and invalid in this context.
> The data is pointing to the end of cdata struct, so it should never be
> null.
> 
> Reported-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
> Hi,
> 
> Changes since v2:
> - Drop the cdata->data check against NULL as it is not a valid test and since we
>   are in sof_get_control_data() the memory has been already allocated
> 
> changes since v1:
> - adjust the payload size for non bytes controls by subtracting the size of the
>   sof_ipc_ctrl_data struct, plus add comment to note this

A corresponding 5.10 backport that "works on my computer".

I also have a 5.4 backport but it's entirely untested.

---
 sound/soc/sof/topology.c | 39 ++++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index c1fc7bcf4eb5..04a721f9a7f9 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -50,7 +50,8 @@
 struct sof_widget_data {
 	int ctrl_type;
 	int ipc_cmd;
-	struct sof_abi_hdr *pdata;
+	void *pdata;
+	size_t pdata_size;
 	struct snd_sof_control *control;
 };
 
@@ -2100,6 +2101,7 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
 				size_t *size)
 {
 	const struct snd_kcontrol_new *kc;
+	struct sof_ipc_ctrl_data *cdata;
 	struct soc_mixer_control *sm;
 	struct soc_bytes_ext *sbe;
 	struct soc_enum *se;
@@ -2136,16 +2138,25 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
 			return -EINVAL;
 		}
 
-		wdata[i].pdata = wdata[i].control->control_data->data;
-		if (!wdata[i].pdata)
-			return -EINVAL;
+		cdata = wdata[i].control->control_data;
+		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES) {
+			if (cdata->data->magic != SOF_ABI_MAGIC)
+				return -EINVAL;
 
-		/* make sure data is valid - data can be updated at runtime */
-		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES &&
-		    wdata[i].pdata->magic != SOF_ABI_MAGIC)
-			return -EINVAL;
+			wdata[i].pdata = cdata->data->data;
+			wdata[i].pdata_size = cdata->data->size;
+		} else {
+			/* points to the control data union */
+			wdata[i].pdata = cdata->chanv;
+			/*
+			 * wdata[i].control->size is calculated with struct_size
+			 * and includes the size of struct sof_ipc_ctrl_data
+			 */
+			wdata[i].pdata_size = wdata[i].control->size -
+					      sizeof(struct sof_ipc_ctrl_data);
+		}
 
-		*size += wdata[i].pdata->size;
+		*size += wdata[i].pdata_size;
 
 		/* get data type */
 		switch (wdata[i].control->cmd) {
@@ -2236,10 +2247,12 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
 	 */
 	if (ipc_data_size) {
 		for (i = 0; i < widget->num_kcontrols; i++) {
-			memcpy(&process->data + offset,
-			       wdata[i].pdata->data,
-			       wdata[i].pdata->size);
-			offset += wdata[i].pdata->size;
+			if (!wdata[i].pdata_size)
+				continue;
+
+			memcpy(&process->data[offset], wdata[i].pdata,
+			       wdata[i].pdata_size);
+			offset += wdata[i].pdata_size;
 		}
 	}
 
-- 
2.31.0
