Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D95D663B25
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 09:33:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 987FC8FBA;
	Tue, 10 Jan 2023 09:32:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 987FC8FBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673339617;
	bh=RdeaoKuT59ZIOLwLEObCeiCSic51srbAgVqBFik0skk=;
	h=Date:From:To:Subject:In-Reply-To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:From;
	b=uMRzzBL539F5s5hQVgHoif/fsXhyGZmvqRWkulLPMwe9eVKwgJQNJSoO74KD9iA51
	 EJABonurrO3YnkeGdlzmPF6jJTr+iHFsEdzWxLtMdBaKpjm/9Jvg566o4PROogVHcg
	 sU0uHfF4PHrQhyy7sYNfoPStpET4dp68ExFr2ZfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1833F804D9;
	Tue, 10 Jan 2023 09:32:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F61AF8024D; Fri,  6 Jan 2023 08:09:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65880F8022B
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 08:09:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65880F8022B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Sr5vX4x4
Received: by mail-wr1-x431.google.com with SMTP id bn26so522133wrb.0
 for <alsa-devel@alsa-project.org>; Thu, 05 Jan 2023 23:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jmWi9bZDXN3pglHijKPhWD+j3tS8sqOh1DGtRprnSX8=;
 b=Sr5vX4x4lGH7sGoHrVj3IrDQ907YCnNl0L2+e8bjCFUYPo7Wpby7tYb7KTOtVPvyNt
 AF895hQj3pDWd4saXgyIYTww2EBvHyZ4q4HUP20FnCpkht7iGbqVsQvOUfydH6BYkF+9
 gY+vMNH8upGbO6fQFK/1cpnuhy2ymvaHU+v8uhpqjcPZtYieU/ZMaBSe2CBBx+fkMDpj
 0M2VdeEIP/Szjx7naNgt/1P5GkV/+dia+BMmpiJA1JEG8n6JyT+GMCNSeycPntqp9zqO
 lKkTcWXiEmMr3Q7ZV+nEP9TORWAQFMamxJbhRjaue9FsFJ51Qpxx9SjI5wY+CT1cG2rm
 YS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jmWi9bZDXN3pglHijKPhWD+j3tS8sqOh1DGtRprnSX8=;
 b=kf9IYZwghOvbfz6/ljW+R8VSy4Cb/AXM2gB2WJtAYEZ2VDCKR/s/h88egOlTRq3RnK
 dwBvVODr4jaUG9u+OmjS/Yycb9vxGdAeok+PoDu7UMrpgrVyfzChgSnQzJZevaY6BoU9
 9WrUBM6G9piz5ubNIaLvgv9wZhiURnid+UqjGWvLYe4s1vss4iSuYo23xHb7KBWv3MJ7
 3bV3z8SZ0aozXbu74Q1YQcL2x8kmuQSVmiLL5NTYnx9de0Uo0lUx9/9xYqU8c5rErjX4
 XIUqtCtQ35VggAo6yNp5LE7Pw3sFEDv7wHxYw4cL/KOHMzL246zhQ1aJgEnLtd9Ye1EI
 oUlw==
X-Gm-Message-State: AFqh2kpVikWukSOq9xAM+HGmERB65WdKAYUWGlzcRmiT37otHPPzCplk
 dQMQjgerswf9zVy91dM7Bek=
X-Google-Smtp-Source: AMrXdXtCoigAjPtfKm6LQOETmhjvNWiGuXj6cDl6NwJ3sWrWJaA2zC6kdCGaITgCi6z8/QO/J8QVBA==
X-Received: by 2002:a5d:4884:0:b0:242:3812:f948 with SMTP id
 g4-20020a5d4884000000b002423812f948mr34184657wrq.24.1672988990387; 
 Thu, 05 Jan 2023 23:09:50 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 z8-20020a5d6548000000b0028df2d57204sm351528wrv.81.2023.01.05.23.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 23:09:49 -0800 (PST)
Date: Fri, 6 Jan 2023 10:09:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, wangweidong.a@awinic.com,
 lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com,
 povik+lin@cutebit.org, pierre-louis.bossart@linux.intel.com,
 james.schulman@cirrus.com, flatmax@flatmax.com,
 cezary.rojewski@intel.com, srinivas.kandagatla@linaro.org,
 tanureal@opensource.cirrus.com, steve@sk2.org, stephan@gerhold.net,
 zhuning0077@gmail.com, shumingf@realtek.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V8 4/5] ASoC: codecs: Aw883xx chip register file, data
 type file and Kconfig Makefile
Message-ID: <202301060009.FsE8n8nW-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221230093454.190579-5-wangweidong.a@awinic.com>
X-Mailman-Approved-At: Tue, 10 Jan 2023 09:32:35 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: duanyibo@awinic.com, lkp@intel.com, zhaolei@awinic.com, liweilei@awinic.com,
 yijiangtao@awinic.com, oe-kbuild-all@lists.linux.dev
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

url:    https://github.com/intel-lab-lkp/linux/commits/wangweidong-a-awinic-com/ASoC-codecs-Add-i2c-and-codec-registration-for-aw883xx-and-their-associated-operation-functions/20221230-173723
base:   bff687b3dad6e0e56b27f4d3ed8a9695f35c7b1a
patch link:    https://lore.kernel.org/r/20221230093454.190579-5-wangweidong.a%40awinic.com
patch subject: [PATCH V8 4/5] ASoC: codecs: Aw883xx chip register file, data type file and Kconfig Makefile
config: loongarch-randconfig-m031-20230103
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
sound/soc/codecs/aw883xx/aw883xx_device.c:1163 aw_dev_dsp_update_container() warn: inconsistent returns '&aw_dev->dsp_lock'.
sound/soc/codecs/aw883xx/aw883xx_device.c:1303 aw_dev_check_sram() warn: inconsistent returns '&aw_dev->dsp_lock'.

Old smatch warnings:
sound/soc/codecs/aw883xx/aw883xx_device.c:1078 aw_dev_update_reg_container() error: uninitialized symbol 'ret'.
sound/soc/codecs/aw883xx/aw883xx_device.c:1271 aw_dev_check_sram() warn: missing unwind goto?

vim +1163 sound/soc/codecs/aw883xx/aw883xx_device.c

acf2ebfd20ae60 Weidong Wang 2022-12-30  1120  static int aw_dev_dsp_update_container(struct aw_device *aw_dev,
acf2ebfd20ae60 Weidong Wang 2022-12-30  1121  			unsigned char *data, unsigned int len, unsigned short base)
acf2ebfd20ae60 Weidong Wang 2022-12-30  1122  {
acf2ebfd20ae60 Weidong Wang 2022-12-30  1123  #ifdef AW_DSP_I2C_WRITES

These ifdefs are not ideal.

acf2ebfd20ae60 Weidong Wang 2022-12-30  1124  	u32 tmp_len;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1125  #else
acf2ebfd20ae60 Weidong Wang 2022-12-30  1126  	u16 reg_val;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1127  #endif
acf2ebfd20ae60 Weidong Wang 2022-12-30  1128  	int i, ret;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1129  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1130  	mutex_lock(&aw_dev->dsp_lock);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1131  #ifdef AW_DSP_I2C_WRITES
acf2ebfd20ae60 Weidong Wang 2022-12-30  1132  	ret = regmap_write(aw_dev->regmap, AW_PID_2049_DSPMADD_REG, base);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1133  	if (ret)
acf2ebfd20ae60 Weidong Wang 2022-12-30  1134  		return ret;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1135  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1136  	for (i = 0; i < len; i += AW_MAX_RAM_WRITE_BYTE_SIZE) {
acf2ebfd20ae60 Weidong Wang 2022-12-30  1137  		if ((len - i) < AW_MAX_RAM_WRITE_BYTE_SIZE)
acf2ebfd20ae60 Weidong Wang 2022-12-30  1138  			tmp_len = len - i;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1139  		else
acf2ebfd20ae60 Weidong Wang 2022-12-30  1140  			tmp_len = AW_MAX_RAM_WRITE_BYTE_SIZE;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1141  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1142  		ret = regmap_raw_write(aw_dev->regmap, AW_PID_2049_DSPMDAT_REG,
acf2ebfd20ae60 Weidong Wang 2022-12-30  1143  					&data[i], tmp_len);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1144  		if (ret)
acf2ebfd20ae60 Weidong Wang 2022-12-30  1145  			return ret;

Needs unlock before returning.

acf2ebfd20ae60 Weidong Wang 2022-12-30  1146  	}
acf2ebfd20ae60 Weidong Wang 2022-12-30  1147  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1148  #else
acf2ebfd20ae60 Weidong Wang 2022-12-30  1149  	/* i2c write */
acf2ebfd20ae60 Weidong Wang 2022-12-30  1150  	ret = regmap_write(aw_dev->regmap, AW_PID_2049_DSPMADD_REG, base);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1151  	if (ret)
acf2ebfd20ae60 Weidong Wang 2022-12-30  1152  		return ret;

Here too

acf2ebfd20ae60 Weidong Wang 2022-12-30  1153  	for (i = 0; i < len; i += 2) {
acf2ebfd20ae60 Weidong Wang 2022-12-30  1154  		reg_val = (data[i] << 8) + data[i + 1];
acf2ebfd20ae60 Weidong Wang 2022-12-30  1155  		ret = regmap_write(aw_dev->regmap, AW_PID_2049_DSPMDAT_REG,
acf2ebfd20ae60 Weidong Wang 2022-12-30  1156  					reg_val);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1157  		if (ret)
acf2ebfd20ae60 Weidong Wang 2022-12-30  1158  			return ret;

Here.

acf2ebfd20ae60 Weidong Wang 2022-12-30  1159  	}
acf2ebfd20ae60 Weidong Wang 2022-12-30  1160  #endif
acf2ebfd20ae60 Weidong Wang 2022-12-30  1161  	mutex_unlock(&aw_dev->dsp_lock);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1162  
acf2ebfd20ae60 Weidong Wang 2022-12-30 @1163  	return 0;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1164  }
acf2ebfd20ae60 Weidong Wang 2022-12-30  1165  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1166  static int aw_dev_dsp_update_fw(struct aw_device *aw_dev,
acf2ebfd20ae60 Weidong Wang 2022-12-30  1167  			unsigned char *data, unsigned int len)
acf2ebfd20ae60 Weidong Wang 2022-12-30  1168  {
acf2ebfd20ae60 Weidong Wang 2022-12-30  1169  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1170  	dev_dbg(aw_dev->dev, "dsp firmware len:%d", len);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1171  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1172  	if (len && (data != NULL)) {

Flip this around.

	if (!len || !data)
		return -EINVAL;

Always do error handling, not success handling.

acf2ebfd20ae60 Weidong Wang 2022-12-30  1173  		aw_dev_dsp_update_container(aw_dev,
acf2ebfd20ae60 Weidong Wang 2022-12-30  1174  			data, len, AW_PID_2049_DSP_FW_ADDR);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1175  		aw_dev->dsp_fw_len = len;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1176  	} else {
acf2ebfd20ae60 Weidong Wang 2022-12-30  1177  		dev_err(aw_dev->dev, "dsp firmware data is null or len is 0");
acf2ebfd20ae60 Weidong Wang 2022-12-30  1178  		return -EINVAL;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1179  	}
acf2ebfd20ae60 Weidong Wang 2022-12-30  1180  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1181  	return 0;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1182  }
acf2ebfd20ae60 Weidong Wang 2022-12-30  1183  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1184  static int aw_dev_copy_to_crc_dsp_cfg(struct aw_device *aw_dev,
acf2ebfd20ae60 Weidong Wang 2022-12-30  1185  			unsigned char *data, unsigned int size)
acf2ebfd20ae60 Weidong Wang 2022-12-30  1186  {
acf2ebfd20ae60 Weidong Wang 2022-12-30  1187  	struct aw_sec_data_desc *crc_dsp_cfg = &aw_dev->crc_dsp_cfg;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1188  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1189  	if (!crc_dsp_cfg->data) {
acf2ebfd20ae60 Weidong Wang 2022-12-30  1190  		crc_dsp_cfg->data = devm_kzalloc(aw_dev->dev, size, GFP_KERNEL);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1191  		if (!crc_dsp_cfg->data)
acf2ebfd20ae60 Weidong Wang 2022-12-30  1192  			return -ENOMEM;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1193  		crc_dsp_cfg->len = size;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1194  	} else if (crc_dsp_cfg->len < size) {
acf2ebfd20ae60 Weidong Wang 2022-12-30  1195  		devm_kfree(aw_dev->dev, crc_dsp_cfg->data);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1196  		crc_dsp_cfg->data = devm_kzalloc(aw_dev->dev, size, GFP_KERNEL);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1197  		if (!crc_dsp_cfg->data) {
acf2ebfd20ae60 Weidong Wang 2022-12-30  1198  			dev_err(aw_dev->dev, "error allocating memory");

I am surprised this error message does not generate a checkpatch
warning.  kmalloc() has its own better warnings.  Delete this one.

acf2ebfd20ae60 Weidong Wang 2022-12-30  1199  			return -ENOMEM;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1200  		}
acf2ebfd20ae60 Weidong Wang 2022-12-30  1201  		crc_dsp_cfg->len = size;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1202  	}
acf2ebfd20ae60 Weidong Wang 2022-12-30  1203  	memcpy(crc_dsp_cfg->data, data, size);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1204  	swab16_array((u16 *)crc_dsp_cfg->data, size >> 1);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1205  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1206  	return 0;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1207  }
acf2ebfd20ae60 Weidong Wang 2022-12-30  1208  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1209  static int aw_dev_dsp_update_cfg(struct aw_device *aw_dev,
acf2ebfd20ae60 Weidong Wang 2022-12-30  1210  			unsigned char *data, unsigned int len)
acf2ebfd20ae60 Weidong Wang 2022-12-30  1211  {
acf2ebfd20ae60 Weidong Wang 2022-12-30  1212  	int ret;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1213  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1214  	dev_dbg(aw_dev->dev, "dsp config len:%d", len);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1215  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1216  	if (len && (data != NULL)) {

Flip this around.

	if (!len || !data)
		return -EINVAL;

	aw_dev_dsp_update_container(aw_dev, data, len,
				    AW_PID_2049_DSP_CFG_ADDR);

acf2ebfd20ae60 Weidong Wang 2022-12-30  1217  		aw_dev_dsp_update_container(aw_dev,
acf2ebfd20ae60 Weidong Wang 2022-12-30  1218  			data, len, AW_PID_2049_DSP_CFG_ADDR);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1219  		aw_dev->dsp_cfg_len = len;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1220  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1221  		ret = aw_dev_copy_to_crc_dsp_cfg(aw_dev, data, len);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1222  		if (ret)
acf2ebfd20ae60 Weidong Wang 2022-12-30  1223  			return ret;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1224  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1225  		ret = aw_dev_set_vcalb(aw_dev);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1226  		if (ret)
acf2ebfd20ae60 Weidong Wang 2022-12-30  1227  			return ret;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1228  		ret = aw_dev_get_ra(&aw_dev->cali_desc);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1229  		if (ret)
acf2ebfd20ae60 Weidong Wang 2022-12-30  1230  			return ret;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1231  		ret = aw_dev_get_cali_f0_delay(aw_dev);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1232  		if (ret)
acf2ebfd20ae60 Weidong Wang 2022-12-30  1233  			return ret;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1234  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1235  		ret = aw_dev_get_vmax(aw_dev, &aw_dev->vmax_desc.init_vmax);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1236  		if (ret) {
acf2ebfd20ae60 Weidong Wang 2022-12-30  1237  			dev_err(aw_dev->dev, "get vmax failed");
acf2ebfd20ae60 Weidong Wang 2022-12-30  1238  			return ret;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1239  		}
acf2ebfd20ae60 Weidong Wang 2022-12-30  1240  		dev_dbg(aw_dev->dev, "get init vmax:0x%x",
acf2ebfd20ae60 Weidong Wang 2022-12-30  1241  						aw_dev->vmax_desc.init_vmax);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1242  		aw_dev->dsp_crc_st = AW_DSP_CRC_NA;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1243  	} else {
acf2ebfd20ae60 Weidong Wang 2022-12-30  1244  		dev_err(aw_dev->dev, "dsp config data is null or len is 0");
acf2ebfd20ae60 Weidong Wang 2022-12-30  1245  		return -EINVAL;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1246  	}
acf2ebfd20ae60 Weidong Wang 2022-12-30  1247  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1248  	return 0;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1249  }
acf2ebfd20ae60 Weidong Wang 2022-12-30  1250  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1251  static int aw_dev_check_sram(struct aw_device *aw_dev)
acf2ebfd20ae60 Weidong Wang 2022-12-30  1252  {
acf2ebfd20ae60 Weidong Wang 2022-12-30  1253  	unsigned int reg_val;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1254  	int ret;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1255  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1256  	mutex_lock(&aw_dev->dsp_lock);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1257  	/* check the odd bits of reg 0x40 */
acf2ebfd20ae60 Weidong Wang 2022-12-30  1258  	ret = regmap_write(aw_dev->regmap, AW_PID_2049_DSPMADD_REG, AW_DSP_ODD_NUM_BIT_TEST);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1259  	if (ret)
acf2ebfd20ae60 Weidong Wang 2022-12-30  1260  		return ret;

goto error;

acf2ebfd20ae60 Weidong Wang 2022-12-30  1261  	ret = regmap_read(aw_dev->regmap, AW_PID_2049_DSPMADD_REG, &reg_val);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1262  	if (reg_val != AW_DSP_ODD_NUM_BIT_TEST || ret) {
acf2ebfd20ae60 Weidong Wang 2022-12-30  1263  		dev_err(aw_dev->dev, "check reg 0x40 odd bit failed, read[0x%x] != write[0x%x]",
acf2ebfd20ae60 Weidong Wang 2022-12-30  1264  				reg_val, AW_DSP_ODD_NUM_BIT_TEST);

This does not set the error code correctly.  Technically, it reg_val is
unintialized if ret is negative so it's an uninitialized variable bug
as well.  Write it like so:

	ret = regmap_read(aw_dev->regmap, AW_PID_2049_DSPMADD_REG, &reg_val);
	if (ret)
		goto error;
	if (reg_val != AW_DSP_ODD_NUM_BIT_TEST) {
		ret = -EINVAL;
		goto error;
	}

acf2ebfd20ae60 Weidong Wang 2022-12-30  1265  		goto error;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1266  	}
acf2ebfd20ae60 Weidong Wang 2022-12-30  1267  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1268  	/* check the even bits of reg 0x40 */
acf2ebfd20ae60 Weidong Wang 2022-12-30  1269  	ret = regmap_write(aw_dev->regmap, AW_PID_2049_DSPMADD_REG, AW_DSP_EVEN_NUM_BIT_TEST);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1270  	if (ret)
acf2ebfd20ae60 Weidong Wang 2022-12-30  1271  		return ret;

goto error;

acf2ebfd20ae60 Weidong Wang 2022-12-30  1272  	ret = regmap_read(aw_dev->regmap, AW_PID_2049_DSPMADD_REG, &reg_val);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1273  	if (reg_val != AW_DSP_EVEN_NUM_BIT_TEST || ret) {
acf2ebfd20ae60 Weidong Wang 2022-12-30  1274  		dev_err(aw_dev->dev, "check reg 0x40 even bit failed, read[0x%x] != write[0x%x]",
acf2ebfd20ae60 Weidong Wang 2022-12-30  1275  				reg_val, AW_DSP_EVEN_NUM_BIT_TEST);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1276  		goto error;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1277  	}
acf2ebfd20ae60 Weidong Wang 2022-12-30  1278  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1279  	/* check dsp_fw_base_addr */
acf2ebfd20ae60 Weidong Wang 2022-12-30  1280  	aw_dev_dsp_write_16bit(aw_dev, AW_PID_2049_DSP_FW_ADDR,	AW_DSP_EVEN_NUM_BIT_TEST);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1281  	aw_dev_dsp_read_16bit(aw_dev, AW_PID_2049_DSP_FW_ADDR, &reg_val);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1282  	if (reg_val != AW_DSP_EVEN_NUM_BIT_TEST) {
acf2ebfd20ae60 Weidong Wang 2022-12-30  1283  		dev_err(aw_dev->dev, "check dsp fw addr failed, read[0x%x] != write[0x%x]",
acf2ebfd20ae60 Weidong Wang 2022-12-30  1284  						reg_val, AW_DSP_EVEN_NUM_BIT_TEST);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1285  		goto error;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1286  	}
acf2ebfd20ae60 Weidong Wang 2022-12-30  1287  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1288  	/* check dsp_cfg_base_addr */
acf2ebfd20ae60 Weidong Wang 2022-12-30  1289  	aw_dev_dsp_write_16bit(aw_dev, AW_PID_2049_DSP_CFG_ADDR, AW_DSP_ODD_NUM_BIT_TEST);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1290  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1291  	aw_dev_dsp_read_16bit(aw_dev, AW_PID_2049_DSP_CFG_ADDR, &reg_val);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1292  	if (reg_val != AW_DSP_ODD_NUM_BIT_TEST) {
acf2ebfd20ae60 Weidong Wang 2022-12-30  1293  		dev_err(aw_dev->dev, "check dsp cfg failed, read[0x%x] != write[0x%x]",
acf2ebfd20ae60 Weidong Wang 2022-12-30  1294  						reg_val, AW_DSP_ODD_NUM_BIT_TEST);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1295  		goto error;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1296  	}
acf2ebfd20ae60 Weidong Wang 2022-12-30  1297  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1298  	mutex_unlock(&aw_dev->dsp_lock);
acf2ebfd20ae60 Weidong Wang 2022-12-30  1299  	return 0;
acf2ebfd20ae60 Weidong Wang 2022-12-30  1300  
acf2ebfd20ae60 Weidong Wang 2022-12-30  1301  error:
acf2ebfd20ae60 Weidong Wang 2022-12-30  1302  	mutex_unlock(&aw_dev->dsp_lock);
acf2ebfd20ae60 Weidong Wang 2022-12-30 @1303  	return -EPERM;

Oh.  Huh.  Change this to "return ret;"

acf2ebfd20ae60 Weidong Wang 2022-12-30  1304  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

